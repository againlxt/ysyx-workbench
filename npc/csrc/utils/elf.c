/*
 * @Author: lxt leixiaotian434@gmail.com
 * @Date: 2024-07-19 17:41:21
 * @LastEditors: lxt leixiaotian434@gmail.com
 * @LastEditTime: 2024-08-19 17:19:06
 * @FilePath: /ysyx-workbench/npc/csrc/single_cycle_cpu/utils/elf.c
 * @Description: Parsing ELF files
 * 
 * Copyright (c) 2024 by ${git_name_email}, All Rights Reserved. 
 */
#include <common.h>
#include <debug.h>
#include <trace/ftrace.h>

#define SYMBOL_TABLE_SIZE	500
#define SECTION_TABLE_SIZE	50
#define Assert_Elf(cond, format, ...) do { \
	if (!(cond)) { \
		free_resources(); \
        Assert(cond, format, ##__VA_ARGS__); \
    } \
} while(0)

static FILE *elf_fp = NULL;
static Elf32_Ehdr *elf_header = NULL;
static Elf32_Shdr *section_header = NULL;
#ifdef CONFIG_FTRACE
static Elf32_Shdr *elf_symbol_table_index = NULL;
static Elf32_Shdr *elf_shstrtab_hdr = NULL;
static Elf32_Shdr *elf_string_table_index = NULL;
static Elf32_Sym elf_symbol_func_table[SYMBOL_TABLE_SIZE] = {};
static size_t func_num = 0;
static char *elf_shstrtab = NULL;
static char *elf_string_table = NULL;
uint32_t ftrace_call_depth = 0; 

/**
 * @description: Check whether the next pc call a function
 * @param {vaddr_t} next_pc
 * @return {*}
 */
Elf32_Sym *find_func_call (vaddr_t next_pc) {
	Elf32_Addr func_addr = 0;
	Elf32_Word func_size = 0;
	for (int i = 0; i < func_num; i ++) {
		func_addr = elf_symbol_func_table[i].st_value;
		func_size = elf_symbol_func_table[i].st_size;
		if(next_pc >= func_addr && next_pc < func_addr + func_size)
			return &(elf_symbol_func_table[i]);
	}

	return NULL;
}

char *find_string (Elf32_Sym *func) {
	return &elf_string_table[func->st_name];
}

#endif

void free_resources() {
    free(elf_header);
    free(section_header);
	#ifdef CONFIG_FTRACE
    free(elf_shstrtab);
    #endif
    fclose(elf_fp); 
}

/**
 * @description: Init the elf file, and parse the func symbol in symbol table from it
 * @param {char} *elf_file_name
 * @return {*}
 */
void init_elf (const char *elf_file_name) {
	if(elf_file_name == NULL) return;

	elf_fp = fopen(elf_file_name, "r");
	Assert_Elf(elf_fp != NULL, "Falied to open elf file!");
	
	#ifdef CONFIG_FTRACE
	int a = 0;
	elf_header = (Elf32_Ehdr*) calloc(1, sizeof(Elf32_Ehdr));
	Assert_Elf(elf_header != NULL, "Failed to allocate memory for ELF header!");

	// Parse elf header(ehdr)
	a = fread(elf_header, sizeof(Elf32_Ehdr), 1, elf_fp);
	Assert_Elf(a == 1, "Failed to read  elf file!");
	// Check ehdr
	Assert_Elf(	elf_header->e_ident[0] == 0x7F &&
			elf_header->e_ident[1] == 'E'  &&
			elf_header->e_ident[2] == 'L'  &&
			elf_header->e_ident[3] == 'F'  ,
			"Input isn't an Elf file!");


	// Parse Section headers table, find the place of symbol table
	Assert_Elf(elf_header->e_shnum <= SECTION_TABLE_SIZE, 
			"Section table size too small to contain input elf file!");

	section_header = (Elf32_Shdr*) malloc(sizeof(Elf32_Shdr) * elf_header->e_shnum);
	Assert_Elf(section_header != NULL, "Failed to allocate memory for section headers!");
	
	a = fseek(elf_fp, elf_header->e_shoff, SEEK_SET);
	Assert_Elf(a == 0, "Failed to move the stream pointer!");

	a = fread(section_header, sizeof(Elf32_Shdr), elf_header->e_shnum, elf_fp);
	Assert_Elf(a == elf_header->e_shnum, "Failed to read section headers!");

	elf_shstrtab_hdr = &(section_header[elf_header->e_shstrndx]);
	elf_shstrtab = (char*) malloc(elf_shstrtab_hdr->sh_size);
	Assert_Elf(elf_shstrtab != NULL, "Failed to allocate memory for section header string table!");
	
	a = fseek(elf_fp, elf_shstrtab_hdr->sh_offset, SEEK_SET);
    Assert_Elf(a == 0, "Failed to move the stream pointer!");

    a = fread(elf_shstrtab, elf_shstrtab_hdr->sh_size, 1, elf_fp);
    Assert_Elf(a == 1, "Failed to read section header string table!");

	for (int i = 0; i < elf_header->e_shnum; i ++) {
		if (section_header[i].sh_type == SHT_SYMTAB) {
			elf_symbol_table_index = &section_header[i];
		} else if (section_header[i].sh_type == SHT_STRTAB && strcmp(&elf_shstrtab[section_header[i].sh_name], ".strtab") == 0) {
			elf_string_table_index = &section_header[i];
		}
	}
	Assert_Elf(elf_symbol_table_index != NULL, "Symbol table section not found!");
	Assert_Elf(elf_string_table_index != NULL, "String table section not found!");


	// Load the string table
	elf_string_table = (char *) malloc(elf_string_table_index->sh_size);
	Assert_Elf(elf_string_table != NULL, "Failed to allocate memory for string table!");

	a = fseek(elf_fp, elf_string_table_index->sh_offset, SEEK_SET);
    Assert_Elf(a == 0, "Failed to move the stream pointer!");

	a = fread(elf_string_table, elf_string_table_index->sh_size, 1, elf_fp);
    Assert_Elf(a == 1, "Failed to read string table!");


	// Find the symbol which type is FUNC
	a = fseek(elf_fp, elf_symbol_table_index->sh_offset, SEEK_SET);
	Assert_Elf(a == 0, "Failed to move the stream pointer!");

	Elf32_Sym symbol_temp;
	for(int i = 0; i < (elf_symbol_table_index->sh_size / sizeof(Elf32_Sym)); i ++) {
		a = fread(&symbol_temp, sizeof(Elf32_Sym), 1, elf_fp);
		Assert_Elf(a == 1, "Failed read the file!");
		if(ELF32_ST_TYPE(symbol_temp.st_info) == STT_FUNC) {
			Assert_Elf(func_num < SYMBOL_TABLE_SIZE, "Symbol table overflow!");
			elf_symbol_func_table[func_num++] = symbol_temp;
		}
	}
	#endif
	
	free_resources();
}

#undef Assert_Elf
#undef SYMBOL_TABLE_SIZE
#undef SECTION_TABLE_SIZE
