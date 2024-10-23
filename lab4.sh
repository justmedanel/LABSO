fisierLOG="syslog.1"

#awk '$1 == "Mar" && $2 == "10" && $5 ~ /systemd/' "$fisierLOG" > loguri.txt
#awk '(/[eE]rror/ || /err/) && $5 == "thermald" {print}' "$fisierLOG" > loguri.txt
#awk '/[eE]rror/ || /err/' "$fisierLOG" > loguri.txt
awk '(/[eE][rR][rR]/ && $5 ~ /thermald/)' "$fisierLOG" > loguri.txt

echo "log salvat in loguri.txt"
awk '{print $5}' loguri.txt | sort | uniq -c | sort -nr | head -n 1