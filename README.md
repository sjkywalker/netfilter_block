# Netfilter Block

Blocks http request for specific host using netfilter.

## Getting started

### Overview

* Blocks user from accessing a certain website
* User request made with HTTP
* Blocking works by scanning HTTP packet content, and identifying host field

### Program flow

1. Place incoming and outgoing packets into netfilter queue.

```bash
$ iptables -F
$ iptables -A INPUT -j NFQUEUE --queue-num 0
$ iptables -A OUTPUT -j NFQUEUE --queue-num 0
```

*You need root priviledges to run the `iptables` command.*

2. Check the packets in netfilter queue, and `DROP` if requested host matches the blockedHost (given as user input).
3. Otherwise, `ACCEPT`.

### Development Environment

```txt
$ uname -a
Linux ubuntu 4.15.0-36-generic #39~16.04.1-Ubuntu SMP Tue Sep 25 08:59:23 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

$ g++ --version
g++ (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

### Prerequisites

This program includes the following headers. Make sure you have the right packages.

```c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <netinet/in.h>
#include <linux/types.h>
#include <linux/netfilter.h>
#include <errno.h>
#include <libnetfilter_queue/libnetfilter_queue.h>
#include <libnet.h>
#include <string.h>
```

The following commands will install some of the essential packages.

```bash
$ sudo apt-get install libnet-dev
$ sudo apt-get install libnetfilter-queue-dev
```

## Running the program

### But first

Remember to reset your `iptables` configuration.

```bash
$ iptables -F
$ iptables -A INPUT -j NFQUEUE --queue-num 0
$ iptables -A OUTPUT -j NFQUEUE --queue-num 0
```

### Build

Simply hit `make` to create object files and executable binary.

```bash
$ make
```

### Run

Format

```bash
$ ./netfilter_block <host>
```

Example

```bash
$ ./netfilter_block test.gilgil.net
```

*You need root priviledges to run the `iptables` command.*

## Acknowledgements

* [gilgil](https://gitlab.com/gilgil/network/wikis/iptables-and-netfilter/netfilter)

## Authors

* **James Sung** - *Initial work* - [sjkywalker](https://github.com/sjkywalker)
* Copyright © 2018 James Sung. All rights reserved.
