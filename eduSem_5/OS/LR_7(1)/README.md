!!!Запуск через sudo!!!
sudo ./a

Посмотреть всех демонов:
ps -ef | awk '$3 == 1'

Узнать pid демона:
cat /var/run/daemon.pid

Посмотреть логи демона (cmd задается в программе, при вызове функции daemonize(cmd)):
cat /var/log/syslog | grep cmd 
В моем случае:
cat /var/log/syslog | grep "my_daemon"

Убиваем демона:
sudo kill -9 pid

Выводим:
ps -ajx | head -1 && ps -ajx | grep pid

Демон не занимает процессорное время.
У демона должен быть STAT = sys
S - прерываемый сон 
s - лидер сессии.
l - Многопоточный режим.

TPGID -1 - управляющего терминала нет.

У демона pid pgid и sid должны совпадать.

Вызвать сигнал SIGHUP
sudo kill -1 pid

S    interruptible sleep (waiting for an event to complete)
(S - ожидает завершения события)
(-D - неприривыаемый Сон в ожидани завршения ввода/вывода)

/var - хранит часто изменяемые файлы. Это директория ядра.
