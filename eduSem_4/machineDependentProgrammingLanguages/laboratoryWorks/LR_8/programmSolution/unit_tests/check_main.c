#include <stdlib.h>
#include <check.h>

#include "check_funcs.h"

int main(void)
{
    int no_failed = 0;
    Suite *s_matrix;
    SRunner *runner;

    s_matrix = check_suite();

    runner = srunner_create(s_matrix);

    srunner_run_all(runner, CK_VERBOSE);

    no_failed = srunner_ntests_failed(runner);

    srunner_free(runner);

    return (no_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
