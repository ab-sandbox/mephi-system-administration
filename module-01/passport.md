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
