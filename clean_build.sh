#!/bin/bash
echo "Очищаем и пересобираем проект..."
cd build
make clean
make -j$(nproc)
echo "Готово!"
