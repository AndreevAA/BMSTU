#include <sys/shm.h>
#include <sys/sem.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <signal.h>

#define WRITERS_NUMBER 	3
#define READER_NUM 		5

int main()
{
	int semid, shmid;
	int ctl_ar, atl_wr, ctl_aw, ctl_ww;
	int status;
	pid_t pid[WRITERS_NUMBER + READER_NUM];
	const int PERMS = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH; 
}