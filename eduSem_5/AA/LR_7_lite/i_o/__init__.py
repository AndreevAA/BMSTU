
class IO:

    brs_cl, bis_cl, ses_cl, brs_time, bis_time, ses_time = None, None, None, None, None, None

    def __init__(self, brs_cl, bis_cl, ses_cl, brs_time, bis_time, ses_time):
        self.brs_cl, self.bis_cl, self.ses_cl, self.brs_time, self.bis_time, self.ses_time = \
            brs_cl, bis_cl, ses_cl, brs_time, bis_time, ses_time

    def out_searching_results(self):
        print("Результат поиска"
              "\n\tПоиск полным перебором:", self.brs_cl,
              "\n\tДвоичный поиск:", self.bis_cl,
              "\n\tАлгоритм с использованием частотного анализа:", self.ses_cl,

              "\n\nАнализ времени(msc):"
              "\n\tВремя поиска полным перебором:", self.brs_time,
              "\n\tВремя двоичного поиска:", self.bis_time,
              "\n\tВремя поиска с помощью алгоритма с использование частотного анализа:", self.ses_time
              )
