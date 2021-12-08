#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>

#define ACTIVE_WRITER   0
#define WAITING_WRITERS 1
#define ACTIVE_READERS  2
#define WAITING_READERS 3

#define WRITERS_NUM     3
#define READERS_NUM     5

struct sembuf start_read[5] = {{WAITING_READERS, 1, SEM_UNDO}, 
                               {WAITING_WRITERS, 0, SEM_UNDO}, 
                               {ACTIVE_WRITER, 0, SEM_UNDO}, 
                               {WAITING_READERS, -1, SEM_UNDO}, 
                               {ACTIVE_READERS, 1, SEM_UNDO}};

struct sembuf stop_read[1] = {{ACTIVE_READERS, -1, SEM_UNDO}};

struct sembuf start_write[5] = {{WAITING_WRITERS, 1, SEM_UNDO}, 
                                {ACTIVE_WRITER, 0, SEM_UNDO}, 
                                {ACTIVE_READERS, 0, SEM_UNDO}, 
                                {WAITING_WRITERS, -1, SEM_UNDO}, 
                                {ACTIVE_WRITER, 1, SEM_UNDO}};

struct sembuf stop_write[1] = {{ACTIVE_WRITER, -1, SEM_UNDO}};

int *shm;

void writer(const int semid, const int index);
void reader(const int semid, const int index);

int main()
{
    int semid, shmid;
    int ctl_ar, ctl_wr, ctl_aw, ctl_ww;
    int status;
    pid_t pid[WRITERS_NUM + READERS_NUM];
    const int PERMS = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;

    if ((semid = semget(IPC_PRIVATE, 4, IPC_CREAT | PERMS)) == -1)
    {
        perror("Semget failed.\n");
	    exit(3);
    }

    ctl_ar = semctl(semid, ACTIVE_READERS, SETVAL, 0);
    ctl_wr = semctl(semid, WAITING_READERS, SETVAL, 0);
    ctl_aw = semctl(semid, ACTIVE_WRITER, SETVAL, 0);
    ctl_ww = semctl(semid, WAITING_WRITERS, SETVAL, 0);
    
    if (ctl_ar == -1 || ctl_wr == -1 || ctl_aw == -1 || ctl_ww == -1)
    {
        perror("Semctl failed.\n" );
        exit(4);
    }
    
    if ((shmid = shmget(IPC_PRIVATE, sizeof(int), IPC_CREAT | PERMS)) == -1)
    {
        perror("Shmget failed.\n");
        exit(5);
    }
    
    shm = shmat(shmid, 0, 0);
    if (*shm == -1)
    {
        perror("Shmat failed.\n");
        exit(6);
    }
    (*shm) = 0;
    
    for (int i = 0; i < WRITERS_NUM; i++)
    {
        pid[i] = fork();
        if (pid[i] == -1)
        {
            perror("Fork failed.\n");
            exit(7);
        }
        if (pid[i] == 0)
        {
            while(1)
                writer(semid, i);
            return 0;
        }
    }
    
    for (int i = WRITERS_NUM; i < WRITERS_NUM + READERS_NUM; i++)
    {
        pid[i] = fork();
        if (pid[i] == -1)
        {
            perror("Fork failed.\n");
            exit(8);
        }
        if (pid[i] == 0)
        {
            while(1)
                reader(semid, i);
            return 0;
        }
    }
    
    while (wait(&status) != -1){}
    if (shmdt(shm) == -1)
    {
        perror("Shmdt failed.\n");
        exit(10);
    }
    
    return 0;
}

void writer(const int semid, const int index)
{
    srand(time(NULL));
    sleep(rand() % 10);
    if (semop(semid, start_write, 5) == -1)
    {
         perror("Semop failed.\n");
         exit(2);
    }
    (*shm)++;
    printf("Писатель %d написал %d\n", index + 1, *shm);
    if (semop(semid, stop_write, 1) == -1)
    {
        perror("Semop failed.\n");
        exit(2);
    }
}

void reader(const int semid, const int index)
{
    srand(time(NULL));
    sleep(rand() % 10);
    if (semop(semid, start_read, 5) == -1)
    {
        perror("Semop failed.\n");
        exit(1);
    }
    printf("Читатель %d прочитал %d\n", index - WRITERS_NUM + 1, *shm);
    if (semop(semid, stop_read, 1) == -1)
    {
        perror("Semop failed.\n");
        exit(1);
    }
}
