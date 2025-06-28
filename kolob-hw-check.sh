#!/bin/bash

# === Цвета ===
green='\e[1;32m'
red='\e[1;31m'
cyan='\e[1;36m'
purple='\e[1;35m'
reset='\e[0m'

echo -e "\n${purple}🧠 K O L O B   H A R D W A R E   C H E C K${reset}\n"

# === 1. Проверка интерфейса ===
iface=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)

if [[ -z "$iface" ]]; then
  echo -e "${red}[✘] Устройство не найдено${reset}"
  exit 1
else
  echo -e "${green}[✔] Устройство найдено: $iface${reset}"
fi

# === 2. Проверка Monitor Mode ===
mon_check=$(iw dev "$iface" info | grep -i type | grep -i monitor)

if [[ -n "$mon_check" ]]; then
  echo -e "${green}[✔] Monitor mode: включён${reset}"
else
  echo -e "${cyan}[!] Monitor mode: выключен (можно включить через: airmon-ng start $iface)${reset}"
fi

# === 3. Проверка драйвера ===
driver=$(basename "$(readlink /sys/class/net/$iface/device/driver 2>/dev/null)")
if [[ -n "$driver" ]]; then
  echo -e "${green}[✔] Драйвер активен: $driver${reset}"
else
  echo -e "${red}[✘] Драйвер не найден${reset}"
fi

# === 4. Мощность сигнала ===
signal=$(grep "$iface" /proc/net/wireless | awk '{ print int($4) }' 2>/dev/null)
if [[ -n "$signal" ]]; then
  echo -e "${green}[📶] Уровень сигнала: -$signal dBm${reset}"
else
  echo -e "${cyan}[📶] Уровень сигнала: недоступен (возможно monitor mode не активен)${reset}"
fi

# === 5. Финал ===
echo -e "\n${green}[🔥] KolobMobile диагностика завершена. Готов к запуску.${reset}\n"
