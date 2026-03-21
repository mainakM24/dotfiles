# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%d-%m-%Y")
day_formatted=$(date "+%a")
time_formatted=$(date "+%H:%M")
battery_status=$(upower -b | grep state | awk '{print $2}')
battery_percentage=$(upower -b | grep percentage | awk '{print $2}')
mem_used=$(free -m | grep Mem | awk '{printf "%.2f",  ($3)/1024}')
mem_total=$(free -m | grep Mem | awk '{printf "%.2f" , ($2)/1024}')
disk_total=$(df -t ext4 | grep dev | awk '{printf "%.2f", $2/(1024*1024)}')
disk_avail=$(df -t ext4 | grep dev | awk '{printf "%.2f", $3/(1024*1024)}')
echo "$day_formatted $date_formatted | $time_formatted | DISK: $disk_avail / $disk_total | MEM: $mem_used / $mem_total | $battery_status : $battery_percentage "

