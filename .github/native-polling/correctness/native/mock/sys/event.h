/* Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
 * SPDX-License-Identifier: GPL-2.0-only
 */
#ifndef NATIVE_POLLING_MOCK_EVENT_H
#define NATIVE_POLLING_MOCK_EVENT_H
#include <stdint.h>
#include <stddef.h>
#include <sys/time.h>
#include <time.h>
struct kevent { uintptr_t ident; int16_t filter; uint16_t flags; uint32_t fflags; intptr_t data; void *udata; };
#define EVFILT_READ (-1)
#define EVFILT_WRITE (-2)
#define EV_ADD 1
#define EV_DELETE 2
#define EV_RECEIPT 0x40
#define EV_ONESHOT 0x10
#define EV_ERROR 0x4000
#define EV_SET(e, a, b, c, d, f, g) do { *(e) = (struct kevent){ (uintptr_t)(a), (b), (c), (d), (f), (g) }; } while (0)
int kqueue(void);
int kevent(int, const struct kevent *, int, struct kevent *, int, const struct timespec *);

#endif
