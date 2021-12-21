#!/bin/bash
sh build_recovery.sh
sh build_app.sh
cd ../../euphonium/scripts
tar -cvf scripts.tar *
cd ../../targets/esp32

# package scripts
cp ../../euphonium/scripts/scripts.tar scripts.tar

tar -czvf euphonium-$EUPH_VER.tar.gz build/*.bin build/partition_table/partition-table.bin build/bootloader/bootloader.bin flash_all.sh
cp build/euphonium-esp32.bin ota.bin
sha256sum ota.bin | cut -d " " -f 1 > ota_checksum.txt
sha256sum scripts.tar | cut -d " " -f 1 > scripts_checksum.txt