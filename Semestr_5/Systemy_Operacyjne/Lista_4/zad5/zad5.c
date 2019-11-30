#include "csapp.h"
#include <stdbool.h>

bool f_lock(const char *path)
{
    if (access(path, F_OK) == 0)
        return false;
    (void)Open(path, O_EXCL | O_CREAT | O_WRONLY, 0700);
    return true;
}
void f_unlock(const char *path)
{
    Unlink(path);
}