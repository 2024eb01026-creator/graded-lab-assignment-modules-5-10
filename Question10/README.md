This program demonstrates signal handling in C.
The parent process runs indefinitely and handles SIGTERM and SIGINT differently.
Two child processes send SIGTERM after 5 seconds and SIGINT after 10 seconds.
The parent exits gracefully after handling SIGINT.
