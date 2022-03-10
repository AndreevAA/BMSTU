/*
Взаимодействие загружаемых модулей ядра.
МОДУЛЬ 3.
демонстрирует сценарий некорректного завершения установки модуля, 
и возможность использования загружаемого модуля в качестве функции 
выполняемой в пространстве ядре
*/

#include <linux/module.h> // макросы MODULE_<...>
#include <linux/init.h>   // __init и __exit
#include "md.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Rusinova Daria");

static int __init md_init(void)
{
    printk("+ Module md3 start.\n");

    printk("+ In md3: Data md1_data exported from md1 contains: %s\n", md1_data);
    printk("+ In md3: Proc md1_proc() exported from md1 returns: %s\n", md1_proc());

    // преднамеренно возвращает ненулевое значение, 
    // что означает ошибку инициализации модуля;
    // тогда такой модуль не будет подгружен к ядру, но произойдёт это 
    // уже после выполнения кода инициализирующей функции модуля в пространстве ядра;
    return -1;

    // insmod: ERROR: could not insert module
    // ./md3.ko: Operation not permitted

    //return 0;
    // никакой ошибки не будет
    /*
    [11784.493105] + Module md1 start.
    [11787.114865] + Module md3 start.
    [11787.114867] + In md3: Data md1_data exported from md1 contains: Hello from md1 module!
    [11787.114868] + In md3: Proc md1_proc() exported from md1 returns: Hello from md1 module!
   */
}

/*
sudo rmmod ./md3.ko
rmmod: ERROR: ../libkmod/libkmod-module.c:799 kmod_module_remove_module() could not remove 'md3': Device or resource busy
rmmod: ERROR: could not remove module ./md3.ko: Device or resource busy
*/
//static void __exit md_exit(void)
//{
//    printk("+ Module md3 exit.\n");
//}

module_init(md_init);
//module_exit(md_exit);
