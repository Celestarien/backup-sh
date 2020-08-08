#!/bin/bash
DATE=$(date +%y%m%d)
sudo borg create --stats --progress --compression lz4 /mnt/sharedfolder_client::backup-$DATE /mnt/sharedfolder_client
