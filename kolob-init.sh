#!/bin/bash

purple='\e[1;35m'
green='\e[1;32m'
reset='\e[0m'

echo -e "${purple}\n🧠 KolobForge: создаём FINAL версию...${reset}"

mkdir -p kolob-pack/sounds && cd kolob-pack || exit 1

# === kolob-wifi.sh
cat << "EOF" > kolob-wifi.sh
#!/bin/bash
echo -e "\e[1;32m🧠 KolobMobile запускается...\e[0m"
bash kolob-logo.sh
sleep 1
bash kolob-dragon.sh
EOF

# === kolob-logo.sh
cat << "EOF" > kolob-logo.sh
#!/bin/bash
sleep 0.2; echo -e "\e[1;36m _  __     _       _     __  __       _     _ _"
sleep 0.2; echo "| |/ /    | |     | |   |  \/  |     | |   (_) |"
sleep 0.2; echo "| ' / ___ | | ___ | |__ | \  / | ___ | |__  _| | ___"
sleep 0.2; echo "|  < / _ \| |/ _ \| '_ \| |\/| |/ _ \| '_ \| | |/ _ \\"
sleep 0.2; echo "| . \ (_) | | (_) | |_) | |  | | (_) | |_) | | |  __/"
sleep 0.2; echo "|_|\_\___/|_|\___/|_.__/|_|  |_|\___/|_.__/|_|_|\___|"
echo -e "     🧠⚡ K O L O B M O B I L E   W I - F I   T O O L\e[0m"
EOF

# === kolob-dragon.sh
cat << "EOF" > kolob-dragon.sh
#!/bin/bash

echo -e "\e[1;35m\n🐉 KolobDragon выходит из теней...\e[0m"
sleep 0.4

# === Звук ревущего зверя
if command -v paplay >/dev/null && [[ -f sounds/roar.wav ]]; then
  paplay sounds/roar.wav &
elif command -v aplay >/dev/null && [[ -f sounds/roar.wav ]]; then
  aplay sounds/roar.wav &
elif command -v play >/dev/null && [[ -f sounds/roar.wav ]]; then
  play sounds/roar.wav &
else
  echo -e "\e[33m[!] Звук недоступен. Дракон рычит молча.\e[0m"
fi

sleep 0.3; echo -e "         \e[5;31m@\e[0m     \e[5;31m@\e[0m    🐉"
sleep 0.3; echo "        /|__/)"
sleep 0.3; echo "       / |  ||"
sleep 0.3; echo "      *  /\\---/\\   🔥🔥🔥"
sleep 0.3; echo "        ~~   ~~"
sleep 0.3; echo -e "\n\e[1;31m     ⬛⬜⬛⬜🔥  M I S S I O N   A B S O L U T E 🔥⬜⬛⬜⬛\e[0m"
EOF

# === Вставляем WAV из base64
cat << "EOF" | base64 -d > sounds/roar.wav
UklGRigAAABXQVZFZm10IBAAAAABAAEAQB8AAEAfAAABAAgAZGF0YQAAAAA=
EOF

chmod +x kolob-*.sh
echo -e "${green}✔ KolobPack финализирован. Выполни:\ncd kolob-pack && bash kolob-wifi.sh${reset}"
