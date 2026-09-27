## Capstone

Итоговый проект курса «Системное администрирование».

Проект развивает скрипт мониторинга ресурсов из модуля 2: скрипт упаковывается в Docker-контейнер, а затем
разворачивается как HTTP-сервис за Nginx с TLS и управлением через systemd.

### Контейнеризация

Сборка образа из корня репозитория:

```bash
docker build -t resource-monitor:1.0 -f capstone/Dockerfile .
```

Запуск через Docker Compose:

```bash
docker compose -f capstone/compose.yaml up -d --build
```

Проверка:

```bash
docker compose -f capstone/compose.yaml ps
docker exec resource-monitor tail -20 /var/www/monitor.log
```

Остановка:

```bash
docker compose -f capstone/compose.yaml down
```

### Хранилище

Для практики с блочными устройствами используются три файла, подключенные как loop-устройства.

На двух устройствах создан RAID 1:

```text
disk1.img -> loop device --\
                            +--> RAID 1 --> ext4 --> /mnt/raid1
disk2.img -> loop device --/
```

Работа массива проверена в деградированном состоянии с последующим восстановлением второго участника.

На третьем устройстве создан LVM:

```text
disk3.img
    |
    v
loop device
    |
    v
PV -> vg_data -> lv_data -> ext4 -> /mnt/lvm
```

Логический том был расширен с 128 MiB до 192 MiB с последующим online-расширением файловой системы ext4.

### Reverse proxy и TLS

Будет добавлено в модуле 4.
