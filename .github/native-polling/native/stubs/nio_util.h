#include <errno.h>
#define RESTARTABLE(cmd, res) do { (res) = (cmd); } while ((res) == -1 && errno == EINTR)
