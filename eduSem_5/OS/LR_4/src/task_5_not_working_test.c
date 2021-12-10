#include <stdio.h> #include <unistd.h> #include <string.h> #include <sys/types.h> #include <sys/wait.h>
#define SUCCESS 0
#define UNABLE_TO_FORK 1 #define EXEC_FAILURE 2 #define UNABLE_TO_PIPE 3 #define CHILDREN 2
#define SLEEP_TIMEOUT 5 #define BUFFSIZE 128
int mode = 0;
void set_mode(int sigint) { mode = 1;
}
int main() {
int child[CHILDREN];
int pipes[CHILDREN]; // 0 for read, 1 for write int pid;
const char *const messages[CHILDREN] = { "message from child 1\t",
"message from child 2\t"
};
char buffer[BUFFSIZE] = { 0 }; if (-1 == pipe(pipes)) {
return UNABLE_TO_PIPE; }
printf("parent: PID: %d, GRP: %d\n", getpid(), getpgrp()); signal(SIGINT, set_mode);
sleep(SLEEP_TIMEOUT);
for (size_t i = 0; i < CHILDREN; i++) {
pid = fork();
if (pid == -1) {
return UNABLE_TO_FORK;
} else if (pid == 0) { if (mode) {
close(pipes[0]);
write(pipes[1], messages[i], strlen(messages[i])); printf("child %d: message sent to pipe\n", i + 1);
} else {
printf("child %d: message was not sent due to signal\n", i + 1);
}
return SUCCESS; } else {
child[i] = pid; }
}
for (size_t i = 0; i < CHILDREN; i++) {
int status = 0;
int status_value = 0;
pid_t childpid = wait(&status);
printf("parent: child %d, finished PID %d, status: %d\n", i + 1, childpid, status);
if (WIFSIGNALED(status_value)) {
printf("parent: child %d finished by signal, code: %d\n", i + 1, WTERMSIG(status_value));
} else if (WIFEXITED(status_value)) {
printf("parent: child %d finished, code: %d\n", i + 1, WEXITSTATUS(status_value));
} else if (WIFSTOPPED(status_value)) {
printf("parent: child %d finished stopped, code: %d\n", i + 1, WSTOPSIG(status_value));
}
}
if (mode) {
close(pipes[1]);
read(pipes[0], buffer, BUFFSIZE); }
printf("parent: received messages:\n%s\n", buffer); printf("parent: finished\n");
return SUCCESS;
}