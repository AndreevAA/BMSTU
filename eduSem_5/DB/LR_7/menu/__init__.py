import config


# Объект меню консольного приложения
class Menu:
    # Приватное поле текста меню программы
    __menu_text = config.MENU_TEXT
    __welcome_input_text = config.WELCOME_INPUT_TEXT
    __program_ended_message = config.EXIT_PROGRAM
    __input_point_error = config.INPUT_POINT_ERROR
    __request = None

    # Статус выбора меню
    __point_menu_status = None

    # Инициализация объекта
    def __init__(self, __request):
        self.__request = __request

        while self.__point_menu_status != 0:

            # Вывод меню
            self.__output_menu_text()

            # Чтение выбора пункта меню
            self.__point_menu_status = self.__input_point_menu_status()

            # Проверка правильности пункта меню
            if self.__is_point_menu_status_correct() == config.ERROR_STATUS:
                # Вывод сообщения об ошибке ввода
                self.__output_input_error()
            else:
                self.__send_request()

        # Вывод сообщения об окончании работы программы
        self.__output_program_ended_message()

    def __send_request(self):
        if self.__point_menu_status == 1:
            self.__request.scalar_query()
        elif self.__point_menu_status == 2:
            self.__request.multi_join_query()
        elif self.__point_menu_status == 3:
            self.__request.cte_window_query()
        elif self.__point_menu_status == 4:
            self.__request.metadata_query()
        elif self.__point_menu_status == 5:
            self.__request.call_scalar_func()
        elif self.__point_menu_status == 6:
            self.__request.call_table_func()
        elif self.__point_menu_status == 7:
            self.__request.stored_procedure()
        elif self.__point_menu_status == 8:
            self.__request.call_sys_func()
        elif self.__point_menu_status == 9:
            self.__request.create_table()
        elif self.__point_menu_status == 10:
            self.__request.fill_table()

    def __is_point_menu_status_correct(self):
        __error_status = config.ERROR_STATUS

        try:
            self.__point_menu_status = int(self.__point_menu_status)
            __error_status = config.SUCCESS_STATUS
        except Exception:
            pass

        if __error_status == config.SUCCESS_STATUS:
            if 0 > self.__point_menu_status or self.__point_menu_status > 10:
                __error_status = config.ERROR_STATUS

        return __error_status

    def __output_menu_text(self):
        print(self.__menu_text)

    def __output_program_ended_message(self):
        print(self.__program_ended_message)

    def __output_input_error(self):
        print(self.__input_point_error)

    def __input_point_menu_status(self):
        return input(self.__welcome_input_text)
