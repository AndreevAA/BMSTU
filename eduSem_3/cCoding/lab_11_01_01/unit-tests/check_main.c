#include <check.h>
#include "check_snprintf.h"

int main(void)
{
    int no_failed = 0;
    SRunner *runner;
    Suite *check_snprintf_s = check_snprintf();
    runner = srunner_create(check_snprintf_s);
    srunner_run_all(runner, CK_VERBOSE);
    no_failed = srunner_ntests_failed(runner);
    srunner_free(runner);

    return (no_failed == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
