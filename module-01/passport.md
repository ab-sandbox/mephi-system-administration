## Паспорт системы

Информация об учебной виртуальной машине Ubuntu 22.04.5 LTS, запущенной в Multipass.

### Пользователь и группы

```bash
$ whoami && id
ubuntu
uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu),4(adm),20(dialout),24(cdrom),25(floppy),27(sudo),29(audio),30(dip),44(video),46(plugdev),118(netdev),119(lxd)
```

Текущий пользователь — `ubuntu` (UID 1000, GID 1000), входит в несколько системных групп, включая `sudo`.

### Ядро и архитектура

```bash
$ uname -a
Linux sysadmin-host 5.15.0-190-generic #200-Ubuntu SMP Fri Aug 7 15:06:04 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
```

Система работает на ядре Linux `5.15.0-190-generic` и архитектуре `x86_64`.

### Операционная система

```bash
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.5 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.5 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

На виртуальной машине установлена Ubuntu 22.04.5 LTS (Jammy Jellyfish), основанная на Debian.

### Время работы и нагрузка

```bash
$ uptime
15:32:52 up 18:52, 1 user, load average: 0.00, 0.00, 0.00
```

Система работает 18 часов 52 минуты; на момент проверки средняя нагрузка за 1, 5 и 15 минут практически отсутствует.

### Оперативная память

```bash
$ free -h
               total        used        free      shared  buff/cache   available
Mem:           1.9Gi       191Mi       932Mi       0.0Ki       833Mi       1.6Gi
Swap:             0B          0B          0B
```

Системе доступно 1,9 GiB оперативной памяти, из которых около 1,6 GiB доступны для использования; swap не настроен.

### Использование файловых систем

```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           196M  984K  195M   1% /run
/dev/sda1       9.6G  2.0G  7.6G  21% /
tmpfs           979M     0  979M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sda15      105M  6.1M   99M   6% /boot/efi
tmpfs           196M  4.0K  196M   1% /run/user/1000
```

Корневая файловая система `/` имеет размер 9,6 GiB, из которых занято 2,0 GiB (21%).

### Блочные устройства

```bash
$ lsblk
NAME    MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
fd0       2:0    1     4K  0 disk
loop0     7:0    0    74M  1 loop /snap/core22/2437
loop1     7:1    0 115.3M  1 loop /snap/lxd/40338
loop2     7:2    0  50.1M  1 loop /snap/snapd/27710
sda       8:0    0    10G  0 disk
├─sda1    8:1    0   9.9G  0 part /
├─sda14   8:14   0     4M  0 part
└─sda15   8:15   0   106M  0 part /boot/efi
sr0      11:0    1    54K  1 rom
```

Система использует виртуальный диск `/dev/sda` размером 10 GiB, основной раздел `/dev/sda1` смонтирован в `/`.

### Процессоры

```bash
$ nproc
2
```

Виртуальной машине доступны 2 логических процессора (vCPU).

### Процессы

```bash
$ ps aux | head -20
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.6 167556 13040 ?        Ss   Sep08   0:01 /sbin/init
root           2  0.0  0.0      0     0 ?        S    Sep08   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   Sep08   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<   Sep08   0:00 [rcu_par_gp]
root           5  0.0  0.0      0     0 ?        I<   Sep08   0:00 [slub_flushwq]
root           6  0.0  0.0      0     0 ?        I<   Sep08   0:00 [netns]
root           8  0.0  0.0      0     0 ?        I<   Sep08   0:00 [kworker/0:0H-events_highpri]
root          10  0.0  0.0      0     0 ?        I<   Sep08   0:00 [mm_percpu_wq]
root          11  0.0  0.0      0     0 ?        S    Sep08   0:00 [rcu_tasks_rude_]
root          12  0.0  0.0      0     0 ?        S    Sep08   0:00 [rcu_tasks_trace]
root          13  0.0  0.0      0     0 ?        S    Sep08   0:00 [ksoftirqd/0]
root          14  0.0  0.0      0     0 ?        I    Sep08   0:00 [rcu_sched]
root          15  0.0  0.0      0     0 ?        S    Sep08   0:00 [migration/0]
root          16  0.0  0.0      0     0 ?        S    Sep08   0:00 [idle_inject/0]
root          18  0.0  0.0      0     0 ?        S    Sep08   0:00 [cpuhp/0]
root          19  0.0  0.0      0     0 ?        S    Sep08   0:00 [cpuhp/1]
root          20  0.0  0.0      0     0 ?        S    Sep08   0:00 [idle_inject/1]
root          21  0.0  0.0      0     0 ?        S    Sep08   0:00 [migration/1]
root          22  0.0  0.0      0     0 ?        S    Sep08   0:00 [ksoftirqd/1]
```

В системе запущены пользовательские процессы и потоки ядра, а `/sbin/init` работает как процесс с PID 1.

### Состояние системы

```bash
$ top -bn1 | head -20
top - 18:00:46 up  2:01,  1 user,  load average: 0.00, 0.00, 0.00
Tasks:  99 total,   1 running,  98 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  3.1 sy,  0.0 ni, 96.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :   1957.9 total,   1561.9 free,    184.5 used,    211.5 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.   1621.7 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   1012 ubuntu    20   0   10768   3860   3252 R   6.7   0.2   0:00.01 top
      1 root      20   0  166288  11656   8424 S   0.0   0.6   0:00.77 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.00 kthreadd
      3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp
      5 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 slub_flushwq
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 netns
      8 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H+
     10 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 mm_percpu_wq
     11 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_tasks_ru+
     12 root      20   0       0      0      0 S   0.0   0.0   0:00.00 rcu_tasks_tr+
     13 root      20   0       0      0      0 S   0.0   0.0   0:00.01 ksoftirqd/0
     14 root      20   0       0      0      0 I   0.0   0.0   0:00.06 rcu_sched
```

На момент проверки система практически простаивает: 96,9% CPU находится в состоянии idle, запущено 99 задач, из них одна выполняется.

### Информация о памяти из `/proc`

```bash
$ cat /proc/meminfo | head -10
MemTotal:        2004932 kB
MemFree:         1599428 kB
MemAvailable:    1660716 kB
Buffers:           19064 kB
Cached:           169644 kB
SwapCached:            0 kB
Active:            86624 kB
Inactive:         154484 kB
Active(anon):        912 kB
Inactive(anon):    61532 kB
```

Ядро сообщает о примерно 2 ГБ оперативной памяти, из которых около 1,66 ГБ доступны для использования.

### Системная конфигурация

```bash
$ ls -l /etc/ | head -15
total 828
drwxr-xr-x 2 root root       4096 Aug 26 14:52 PackageKit
drwxr-xr-x 4 root root       4096 Aug 26 14:52 X11
-rw-r--r-- 1 root root       3028 Aug 26 14:50 adduser.conf
drwxr-xr-x 2 root root       4096 Aug 26 14:54 alternatives
drwxr-xr-x 3 root root       4096 Aug 26 14:52 apparmor
drwxr-xr-x 8 root root       4096 Aug 26 14:52 apparmor.d
drwxr-xr-x 3 root root       4096 Aug 26 14:52 apport
drwxr-xr-x 8 root root       4096 Aug 26 14:55 apt
-rw-r--r-- 1 root root       2319 Jan  6  2022 bash.bashrc
-rw-r--r-- 1 root root         45 Nov 11  2021 bash_completion
drwxr-xr-x 2 root root       4096 Aug 26 14:52 bash_completion.d
-rw-r--r-- 1 root root        367 Dec 16  2020 bindresvport.blacklist
drwxr-xr-x 2 root root       4096 Apr  7  2022 binfmt.d
drwxr-xr-x 2 root root       4096 Aug 26 14:52 byobu
```

Каталог `/etc` содержит системные конфигурационные файлы и подкаталоги, в основном принадлежащие пользователю `root`.

### Процессор

```bash
$ cat /proc/cpuinfo | grep "model name" | uniq
model name	: 13th Gen Intel(R) Core(TM) i7-13700H
```

Виртуальная машина использует виртуальные процессоры, предоставленные на базе Intel Core i7-13700H.

### Дерево процессов

```bash
$ pstree -p | head -30 || ps -ef --forest | head -30
systemd(1)-+-agetty(631)
           |-agetty(647)
           |-cron(608)
           |-dbus-daemon(610)
           |-irqbalance(616)---{irqbalance}(620)
           |-multipathd(412)-+-{multipathd}(417)
           |                 |-{multipathd}(418)
           |                 |-{multipathd}(419)
           |                 |-{multipathd}(420)
           |                 |-{multipathd}(421)
           |                 `-{multipathd}(422)
           |-networkd-dispat(617)
           |-polkitd(670)-+-{polkitd}(673)
           |              `-{polkitd}(675)
           |-rsyslogd(618)-+-{rsyslogd}(654)
           |               |-{rsyslogd}(655)
           |               `-{rsyslogd}(656)
           |-snapd(622)-+-{snapd}(660)
           |            |-{snapd}(661)
           |            |-{snapd}(662)
           |            |-{snapd}(663)
           |            |-{snapd}(664)
           |            |-{snapd}(687)
           |            |-{snapd}(758)
           |            `-{snapd}(793)
           |-sshd(652)-+-sshd(737)---sshd(860)
           |           `-sshd(922)---sshd(1000)---bash(1001)-+-head(1068)
           |                                                 `-pstree(1067)
           |-systemd(752)---(sd-pam)(753)
           |-systemd-journal(376)
```

Дерево процессов начинается с `systemd` (PID 1), от которого запущены системные службы и пользовательские процессы.

### Процесс PID 1

```bash
$ cat /proc/1/status
Name:	systemd
Umask:	0000
State:	S (sleeping)
Tgid:	1
Ngid:	0
Pid:	1
PPid:	0
TracerPid:	0
Uid:	0	0	0	0
Gid:	0	0	0	0
FDSize:	128
Groups:
NStgid:	1
NSpid:	1
NSpgid:	1
NSsid:	1
VmPeak:	  231676 kB
VmSize:	  166288 kB
VmLck:	       0 kB
VmPin:	       0 kB
VmHWM:	   11656 kB
VmRSS:	   11656 kB
RssAnon:	    3232 kB
RssFile:	    8424 kB
RssShmem:	       0 kB
VmData:	   19408 kB
VmStk:	     132 kB
VmExe:	     896 kB
VmLib:	    9056 kB
VmPTE:	      88 kB
VmSwap:	       0 kB
HugetlbPages:	       0 kB
CoreDumping:	0
THP_enabled:	1
Threads:	1
SigQ:	0/7519
SigPnd:	0000000000000000
ShdPnd:	0000000000000000
SigBlk:	7be3c0fe28014a03
SigIgn:	0000000000001000
SigCgt:	00000001000004ec
CapInh:	0000000000000000
CapPrm:	000001ffffffffff
CapEff:	000001ffffffffff
CapBnd:	000001ffffffffff
CapAmb:	0000000000000000
NoNewPrivs:	0
Seccomp:	0
Seccomp_filters:	0
Speculation_Store_Bypass:	thread vulnerable
SpeculationIndirectBranch:	conditional enabled
Cpus_allowed:	3
Cpus_allowed_list:	0-1
Mems_allowed:	00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000000,00000001
Mems_allowed_list:	0
voluntary_ctxt_switches:	1712
nonvoluntary_ctxt_switches:	629
```

Процесс с PID 1 — `systemd`, запущенный от `root`, являющийся корневым процессом пользовательского пространства системы.
