#!/bin/bash

# 1. Definisikan Variabel
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H%M%S)
DEVICE="cam01"
OUTPUT_DIR="/mnt/nas_attendance/$DATE/$DEVICE"
FILENAME="${DEVICE}_${TIME}.mp4"

# 2. Buat direktori (gunakan sudo jika izin ditolak)
mkdir -p "$OUTPUT_DIR"

# 3. Jalankan FFmpeg (SATU BARIS UTUH)
ffmpeg -f v4l2 -video_size 640x480 -framerate 15 -i /dev/video0 -c:v libx264 -preset ultrafast -tune zerolatency -b:v 800k -t 30 "$OUTPUT_DIR/$FILENAME"

