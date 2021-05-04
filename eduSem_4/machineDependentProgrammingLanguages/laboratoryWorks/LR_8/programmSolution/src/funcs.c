#include "funcs.h"

size_t asmstrlen(const char *str)
{
    size_t len = 0;
    const char *str_copy = str;

    __asm__(
        ".intel_syntax noprefix\n"
        "mov rcx, -1\n"
        "mov al, 0\n"
        "mov rdi, %1\n"
        "repne scasb\n"
        "neg rcx\n"
        "sub rcx, 2\n"
        "mov %0, rcx\n"
        : "=r"(len)
        : "r"(str_copy)
        : "%rax", "%rcx", "%rdi", "%al");

    return len;
}
