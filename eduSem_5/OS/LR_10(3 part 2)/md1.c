/*
Взаимодействие загружаемых модулей ядра.
МОДУЛЬ 1.
демонстрирует возможность создания 
экспортируемых данных и  функций
*/

#include <linux/module.h> // макросы MODULE_<...>
#include <linux/init.h>   // __init и __exit
#include "md.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Andreev Alexander");

// единообразное поведение системы на 
// разных кодировках
char *md1_data = "Привет из модуля md1!";

extern char *md1_proc(void)
{
    return md1_data;
}

static char *md1_local(void)
{
    return md1_data;
}

extern char *md1_noexport(void)
{
    return md1_data;
}

/*
Модуль md1 экспортирует для использования другими модулями 
имя процедуры md1_proc() и имя структуры данных md1_data. 
Любой другой модуль (md2) может использовать в своём коде 
любые экспортируемые имена.
Если закомментировать 
//EXPORT_SYMBOL(md1_data); 
//EXPORT_SYMBOL(md1_proc); 
Будет ошибка линковщика: 
ERROR: modpost: "md1_proc" [/media/sf_OS_bmstu/sem_02/lab_03/task_02/md3.ko] undefined!
ERROR: modpost: "md1_data" [/media/sf_OS_bmstu/sem_02/lab_03/task_02/md3.ko] undefined!
ERROR: modpost: "md1_proc" [/media/sf_OS_bmstu/sem_02/lab_03/task_02/md2.ko] undefined!
ERROR: modpost: "md1_data" [/media/sf_OS_bmstu/sem_02/lab_03/task_02/md2.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:111: /media/sf_OS_bmstu/sem_02/lab_03/task_02/Module.symvers] Error 1
*/

EXPORT_SYMBOL(md1_data);
EXPORT_SYMBOL(md1_proc);

/*
Модуль md2 связывается с экспорт-м именем по абсолютному адресу. 
-> бессмысленно предоставлять модуль в собранном виде — 
он должен собираться на месте использования.
*/

static int __init md_init(void)
{
    /* + - для того чтобы проще было обнаружить сообщения 
     (маркер, отмечающий вывод из собственных модулей) */

    printk("+ Module md1 start.\n");
    return 0;
}

static void __exit md_exit(void)
{
    // printk("+ In md1: Proc md1_local returns: %s\n", md1_local());
    // Вывод: [11029.614124] + In md1: Proc md1_local returns: Hello from md1 module!

    printk("+ Module md1 exit.\n");
}

module_init(md_init);
module_exit(md_exit);
