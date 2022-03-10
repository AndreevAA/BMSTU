/*
Взаимодействие загружаемых модулей ядра.
МОДУЛЬ 2.
демонстрирует использование данных и функций 
экспортируемых первым модулем
*/

#include <linux/module.h> // макросы MODULE_<...>
#include <linux/init.h>   // __init и __exit
#include "md.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Tursunov Jasur");

static int __init md_init(void)
{
    printk("+ Module md2 start.\n");

    printk("+ In md2: Data md1_data exported from md1 contains: %s\n", md1_data);
    printk("+ In md2: Proc md1_proc() exported from md1 returns: %s\n", md1_proc());

    return 0;
}

static void __exit md_exit(void)
{
    // ОШИБКА КОМПИЛЯЦИИ при вызове md1_local()
    // printk("+ In md2: Proc md1_local returns: %s\n", md1_local());
    // /media/sf_OS_bmstu/sem_02/lab_03/task_02/md2.c:29:54: error: implicit declaration of function ‘md1_local’ [-Werror=implicit-function-declaration]
    // 29 |     printk("+ In md2: Proc md1_local returns: %s\n", md1_local());

    // ОШИБКА КОМПИЛЯЦИИ при вызове md1_noexport()
    printk("+ In md2: Proc md1_noexport returns: %s\n", md1_noexport());
    
    // /media/sf_OS_bmstu/sem_02/lab_03/task_02/md2.c:34:57: error: implicit declaration of function ‘md1_noexport’ [-Werror=implicit-function-declaration]
    // 34 |     printk("+ In md2: Proc md1_noexport returns: %s\n", md1_noexport());

    printk("+ Module md2 exit.\n");
}

module_init(md_init);
module_exit(md_exit);
