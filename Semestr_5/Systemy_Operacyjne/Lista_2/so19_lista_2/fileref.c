#include "csapp.h"

static char buf[256];

#define LINE1 49
#define LINE2 33
#define LINE3 78



static void do_read(int fd) {

  const int chars_to_read = 10;
  pid_t pid = Fork();
  
  off_t prev_offset = Lseek(fd,0,SEEK_CUR);
  printf("[%d] : %ld\n", getpid(), prev_offset);
  
  Read(fd,buf,chars_to_read);

  off_t end_offset = Lseek(fd,0,SEEK_CUR);
  printf("[%d] : %ld\n", getpid(), end_offset);
  exit(0);
}

static void do_close(int fd) {

  pid_t child_pid = Fork();
  pid_t pid = getpid();

  if (child_pid)
  {
    Close(fd);
    printf("[%d]: closed the file.\n",pid);
    Waitpid(child_pid, NULL, WUNTRACED);
    exit(0);
  }
  else
  {
    const int chars_to_read = 32;
    sleep(2);
    if (Read(fd,buf,chars_to_read) != chars_to_read)
    {
      app_error("[%d]: Failed to load the file!\n",pid);
    }
    buf[chars_to_read] = '\0';
    printf("[%d]: %s\n", pid, buf);
  }
  
  
  exit(0);
}

int main(int argc, char **argv) {
  if (argc != 2)
    app_error("Usage: %s [read|close]", argv[0]);

  int fd = Open("test.txt", O_RDONLY, 0);

  if (!strcmp(argv[1], "read"))
    do_read(fd);
  if (!strcmp(argv[1], "close"))
    do_close(fd);
  app_error("Unknown variant '%s'", argv[1]);
}
