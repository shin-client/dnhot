#!/bin/bash
cd hulk

while true; do
    echo "Bắt đầu chạy hulk..."
    go run hulk.go -site https://ccams.thongtinxuanloc.com/ &  # Chạy trong background
    PID=$!  # Lưu PID của tiến trình vừa chạy
    echo "PID: $PID"
    sleep 420  # Chờ 30 phút (1800 giây)
    echo "Dừng hulk..."
    kill $PID  # Giết tiến trình
    sleep 1  # Nghỉ 1 giây trước khi chạy lại
    echo "Khởi động lại..."
done
