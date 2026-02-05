#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    printf("Parent PID: %d\n", getpid());

    // Create multiple child processes
    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child %d created with PID %d\n", i + 1, getpid());
            sleep(2);   // simulate work
            exit(0);    // child exits
        }
    }

    // Parent cleans up child processes
    for (i = 0; i < 3; i++) {
        pid = wait(NULL);
        printf("Parent cleaned up child with PID %d\n", pid);
    }

    printf("All child processes cleaned. No zombies.\n");
    return 0;
}

