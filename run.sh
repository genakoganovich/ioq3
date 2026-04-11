#!/bin/bash

# Исходная папка с QVM после сборки
SRC_DIR="$HOME/ioq3/build/Release/baseq3/vm"
# Папка, куда нужно скопировать QVM для запуска
DST_DIR="$HOME/.local/share/Quake3/ioq3/vm"

# Создаём папку назначения, если её нет
mkdir -p "$DST_DIR"

# Копируем файлы ui.qvm, cgame.qvm, qagame.qvm с заменой существующих
cp -f "$SRC_DIR"/{ui,qagame,cgame}.qvm "$DST_DIR"/

# Запуск ioquake3
cd "$HOME/ioq3/build/Release" || exit 1
./ioquake3 +set fs_game ioq3 +set sv_pure 0 +map q3dm1
