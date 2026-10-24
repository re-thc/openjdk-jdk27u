/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#include <errno.h>
#define RESTARTABLE(cmd, res) do { (res) = (cmd); } while ((res) == -1 && errno == EINTR)
