#include <sys/shm.h>
#include <sys/sem.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <signal.h>

#define SE 0
#define SF 1
#define SB 2

const int buffer_size = 10;
const int permissions = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
const int consumer_num = 3;
const int producer_num = 3;

struct sembuf semops_produce_begin[2] = {
	{SE, -1, 0},
	{SB, -1, 0}
};

struct sembuf semops_produce_end[2] = {
	{SB, 1, 0},
	{SF, 1, 0}
};

struct sembuf semops_consume_begin[2] = {
	{SF, -1, 0},
	{SB, -1, 0}
};

struct sembuf semops_consume_end[2] = {
	{SB, 1, 0},
	{SE, 1, 0}
};

int** shm_cons_pos;
int** shm_prod_pos;
int* shm_buffer;

pid_t* pid_arr;


void kill_producers();

void kill_consumers();

int* get_shm();

int get_sem_fd();

int produce(int sem_fd, int number);
int consume(int sem_fd, int number);

void get_producer(int number, int sem_fd);
void get_consumer(int number, const int sem_fd);

int main()
{
	int *shm = get_shm();

    shm_cons_pos = shm;
	shm_prod_pos = shm + 2;
    *(shm + 4) = 0;
	shm_buffer = shm + 5;
    pid_arr = shm + 5 + buffer_size;

	*shm_cons_pos = shm_buffer;
	*shm_prod_pos = shm_buffer;
    
	int sem_fd = get_sem_fd();

	if (semctl(sem_fd, SE, SETVAL, consumer_num + producer_num) == -1 ||
		semctl(sem_fd, SF, SETVAL, 0) == -1 ||
		semctl(sem_fd, SB, SETVAL, 1) == -1)
	{
		perror("Semctl failed");
		exit(1);
	}

    int i = 0;
    while(i < producer_num)
    {
        get_producer(i, sem_fd);
        i++;
    }

	int j = producer_num;
	while(j < producer_num + consumer_num)
	{
		get_consumer(j, sem_fd);
		j++;
	}
	
	for (int i = 0; i < consumer_num + producer_num; i++)
	{
        int *status = NULL;

        if (wait(status) == -1)
        {
            printf("Waitpid");
            exit(9);
        }
        if (WIFEXITED(status))
        {
            printf("\tChild exited with code = %d\n", WEXITSTATUS(status));
        }
        else if (WIFSIGNALED(status))
        {
            printf("\tChild with (signal %d) killed\n", WTERMSIG(status));
        }
        else if (WIFSTOPPED(status))
        {
            printf("\tChild with (signal %d) stopped\n", WSTOPSIG(status));
        }
        else
            printf("\tChild terminated abnormally \n");
    }

	if (shmdt(shm) == -1)
    {
		perror("Shmdt failed.\n");
        exit(10);
    }

	return 0;
}


void kill_producers() 
{
    for (int i = 0; i < producer_num; i++) {
        if (pid_arr[i] == getpid()) {
            continue;
        }
        kill(pid_arr[i], SIGTERM);
    }
    exit(0);
}

void kill_consumers() 
{
    for (int i = producer_num; i < producer_num + consumer_num; i++) {
        if (pid_arr[i] == getpid()) {
            continue;
        }
        kill(pid_arr[i], SIGTERM);
    }
    kill(getpid(), SIGKILL);
}

int* get_shm()
{
    int shm_id;
    int* shm;

    shm_id = shmget(100, sizeof(int) * (buffer_size + 1) + (producer_num + consumer_num) * sizeof(pid_t) + sizeof(int*) * 2, IPC_CREAT|permissions);
    
    if (shm_id == -1)
    {
        perror("Shmget failed.\n");
        exit(1);
    }

    shm = (int*) shmat(shm_id, NULL, 0);
    if (*shm == -1)
    {
        perror("Shmat failed.\n");
        exit(2);
    }

    return shm;
}

int get_sem_fd()
{
    int sem_fd = semget(101, 3, IPC_CREAT | permissions);
    if (sem_fd == -1)
    {
        perror("Semget failed.\n");
        exit(3);
    }
    return sem_fd;
}

int produce(int sem_fd, int number)
{
    srand(time(NULL));
    sleep(rand() % 5);
    
    if (semop(sem_fd, semops_produce_begin, 2) == -1)
    {
        perror("Semop failed.\n");
        exit(4);
    }
    int **shm_prod_pos = shm_buffer - 3;
    int *prod_pos = *shm_prod_pos;

    if (*(prod_pos - 1) >= buffer_size)
    {
        if (semop(sem_fd, semops_produce_end, 2) == -1)
        {
            perror("Semop failed.\n");
            exit(5);
        }
        kill_producers();
        return 0;
    }
    
    *prod_pos = *(prod_pos - 1) + 1;
    printf("Производитель %d, pid=%d создал значение %d\n", number, getpid(), *prod_pos);
    prod_pos++;
    *shm_prod_pos = prod_pos;

    if (semop(sem_fd, semops_produce_end, 2) == -1)
    {
        perror("Semop failed.\n");
        exit(6);
    }

    return 0;
}

int consume(int sem_fd, int number)
{
    srand(time(NULL));
    sleep(rand() % 5 + 5);
    
    if (semop(sem_fd, semops_consume_begin, 2) == -1)
    {   
        perror("Semop failed.\n");
        exit(7);
    }
    int **shm_cons_pos = shm_buffer - 5;
    int *cons_pos = *shm_cons_pos;
    if (cons_pos - shm_buffer >= buffer_size)
    {
        if (semop(sem_fd, semops_consume_end, 2) == -1)
        {
            perror("Semop failed.\n");
            exit(1);
        }
        kill_consumers();
        return 0;
    }
    printf("Потребитель %d, pid=%d прочитал значение: %d\n", number, getpid(), *cons_pos);
    cons_pos++;
    *shm_cons_pos = cons_pos;

    if (semop(sem_fd, semops_consume_end, 2) == -1)
    {
        perror("Semop failed.\n");
        exit(8);
    }

    return 0;
}

void get_producer(int number, int sem_fd) {
    pid_t pid;
    if ((pid = fork()) == -1) 
    {
        printf("Fork failed.\n");
        exit(4);
    }

    if(pid == 0) 
    {
        printf("Создан производитель %d, pid: %d\n", number, getpid());
        while(1)
            produce(sem_fd, number);
    }
    else
    {
        pid_arr[number] = pid;
    }
}

void get_consumer(int number, const int sem_fd) {
    pid_t pid;

    if ((pid = fork()) == -1) 
    {
        printf("Fork failed.\n");
        exit(1);
    }

    if(pid == 0) 
    {
        printf("Создан потребитель %d, pid: %d\n", number, getpid());
        while(1)
            consume(sem_fd, number);
    } 
    else
    {
        pid_arr[number] = pid;
    }
}
