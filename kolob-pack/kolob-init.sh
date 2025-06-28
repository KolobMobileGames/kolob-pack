#!/bin/bash

# === Цвета
purple='\e[1;35m'
green='\e[1;32m'
reset='\e[0m'

echo -e "${purple}\n🧠 KolobForge инициализирует проект...${reset}"

# === Создание структуры
mkdir -p kolob-pack && cd kolob-pack || exit 1

# === Скрипты: kolob-wifi.sh
cat << "EOF" > kolob-wifi.sh
#!/bin/bash
# 💣 Заглушка KolobMobile. Полная версия добавляется позже.
echo -e "\e[1;35m🧠 KolobMobile launching... (сюда встает основной скрипт)\e[0m"
EOF

# === kolob-dragon.sh
cat << "EOF" > kolob-dragon.sh
#!/bin/bash
# 🐉 Kolob Dragon — ASCII в отдельном файле
echo -e "\e[1;35m(сюда добавим финального ASCII-дракона)\e[0m"
EOF

# === kolob-hw-check.sh
cat << "EOF" > kolob-hw-check.sh
#!/bin/bash
# 🔍 Проверка железа KolobMobile
echo "[✔] Проверка интерфейса..."
EOF

# === kolob-logo.sh
cat << "EOF" > kolob-logo.sh
#!/bin/bash
# 🎞 Анимация логотипа Kolob
echo "Kolob Logo — построчная анимация"
EOF

# === Автостарт .desktop
cat << "EOF" > kolob-autostart.desktop
[Desktop Entry]
Type=Application
Name=KolobMobile
Exec=bash -c '~/kolob-pack/kolob-wifi.sh --auto'
Terminal=true
X-GNOME-Autostart-enabled=true
EOF

# === README.md
cat << "EOF" > README.md
# 🧠 KolobMobile Pack

Полный комплект для запуска Kolob — автоматического Wi-Fi-атакующего инструмента.

## Установка

\`\`\`bash
git clone https://github.com/Kolobmobile/kolob-pack.git
cd kolob-pack
bash kolob-wifi.sh --auto
\`\`\`

## Команды

- \`kolob-atack\` — запуск атаки
- \`kolob-check --check\` — диагностика железа
- \`kolob-drag --demo\` — только логотип и дракон

## Установка автозапуска (необязательно)

Поместите \`kolob-autostart.desktop\` в \`~/.config/autostart\`
EOF

# === Права
chmod +x kolob-*.sh

echo -e "${green}✔ KolobPack собран. Готов к пушу на GitHub.${reset}"
