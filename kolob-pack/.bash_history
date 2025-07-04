++
sudo apt install zsh-autosuggestions zsh-syntax-highlighting -y
# Автоподсказки
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Подсветка синтаксиса
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sudo apt install tmux -y
p10k configure
exec zsh
sudo apt install aircrack-ng hostapd dnsmasq -y
git clone https://github.com/Danyalkhattak/wifi-attack-tool.git
cd wifi-attack-tool
pip install -r requirements.txt
sudo apt install python3-pip
sudo python3 main.py
sudo apt update
sudo apt install pciutils usbutils -y
lsusb
ip link show
nano ~/.bashrc
dmesg | grep firmware
┌──(kolob㉿ChefZentralle)-[~]
└─$ dmesg | grep firmware
[    0.085392] Spectre V2 : Enabling Speculation Barrier for firmware calls
chmod +x wifi-check.sh
chmod +x"C:\Users\kolob\Desktop\wifi-check.sh"
┌──(kolob㉿ChefZentralle)-[~]
└─$ chmod +x wifi-check.sh
chmod: cannot access 'wifi-check.sh': No such file or directory
┌──(kolob㉿ChefZentralle)-[~]
└─$ chmod +x"C:\Users\kolob\Desktop\wifi-check.sh"
chmod: missing operand after ‘+xC:\\Users\\kolob\\Desktop\\wifi-check.sh’
Try 'chmod --help' for more information.
┌──(kolob㉿ChefZentralle)-[~]
└─$nano wifi-check.sh
green="\e[1;32m"
red="\e[1;31m"
cyan="\e[1;36m"
reset="\e[0m"
echo -e "${cyan}🔍 KolobMobile: проверка Wi-Fi оборудования...${reset}"
# 1. Проверка интерфейсов
iface=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)
if [ -z "$iface" ]; then     echo -e "${red}❌ Wi-Fi интерфейс не найденiface=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1){reset}"; else     echo -e "${green}✅ Интерфейс обнаружен: $iface${reset}"; fi
# 2. Проверка nl80211
driver_check=$(iw list 2>&1 | grep nl80211)
if [[ "$driver_check" == *"nl80211"* ]]; then     echo -e "${green}✅ nl80211 поддерживается драйвером${reset}"; else     echo -e "${red}❌ nl80211 НЕ поддерживается${reset}"; fi
# 3. Поддержка режима мониторинга
monitor=$(iw list 2>/dev/null | grep -A10 "Supported interface modes" | grep monitor)
if [ -z "$monitor" ]; then     echo -e "${red}❌ Режим мониторинга НЕ поддерживается${reset}"; else     echo -e "${green}✅ Поддержка режима мониторинга найдена${reset}"; fi
# 4. Проверка утилит
for tool in airmon-ng aircrack-ng iwconfig iw lsusb; do     if ! command -v $tool &> /dev/null; then         echo -e "${red}❌ $tool не установлен${reset}";     else         echo -e "${green}✅ $tool доступен${reset}";     fi; done
echo -e "\n${cyan}🎯 Готовность завершена. Если всё зелёное — можно в бойdone{reset
nano ~/.bashrc
alias kolobcheck='bash ~/wifi-check.sh'

nano ~/.zshrc~
nano ~/.zshrc
nano ~/.bashrc
nano ~/.zshrc
alias kolobcheck='bash ~/wifi-check.sh'
alias kolobcheck='bash ~/wifi-check.sh'
nano ~/.bashrc
ls
lr
sudo apt install lr
sudo apt update
sudo apt full-upgrade -y kali-tweaks
ssudo apt full-upgrade -y
sudo apt full-upgrade -y
kali-tweaks
kali-tools-hardware
kali-tweaks
cd ~/.zsh
──(kolob㉿ChefZentralle)-[~]
└─$ cd ~/.zsh
-bash: cd: /home/kolob/.zsh: No such file or directory
mkdir ~/.zsh
cd ~/.zsh
                                                                                                                                                              sudo apt update
sudo apt install zsh git curl neofetch figlet toilet cowsay fortune pciutils usbutils aircrack-ng -y
sudo gem install lolcat
sudo apt install neofetch -y
git clone https://github.com/dylanaraps/neofetch.git
cd neofetch
sudo make install
sudo apt install neofetch -y
git clone https://github.com/dylanaraps/neofetch
cd neofetch
sudo make install
┌──(kolob㉿ChefZentralle)-[~/neofetch]
└─$ git clone https://github.com/dylanaraps/neofetch
cd neofetch
sudo make install
fatal: destination path 'neofetch' already exists and is not an empty directory.
-bash: cd: neofetch: Not a directory
neofetch
sudo apt install ruby -y
sudo gem install lolcat
sudo apt install git curl zsh figlet toilet cowsay fortune-mod pciutils usbutils aircrack-ng ruby ruby-dev -y
sudo gem install lolcat
git clone https://github.com/dylanaraps/neofetch
cd neofetch && sudo make install
sudo apt install git curl zsh figlet toilet cowsay fortune-mod pciutils usbutils aircrack-ng ruby ruby-dev -y
sudo gem install lolcat
git clone https://github.com/dylanaraps/neofetch
cd neofetch && sudo make installsudo apt install git curl zsh figlet toilet cowsay fortune-mod pciutils usbutils aircrack-ng ruby ruby-dev -y
sudo gem install lolcat
git clone https://github.com/dylanaraps/neofetch
cd neofetch && sudo make install
sudo apt install make -y
sudo gem install lolcat
sudo apt install ruby ruby-dev -y
echo "KolobMobile Activated" | lolcat
figlet "Welcome" | lolcat
┌──(kolob㉿ChefZentralle)-[~/neofetch]
└─$ echo "KolobMobile Activated" | lolcat
KolobMobile Activated
┌──(kolob㉿ChefZentralle)-[~/neofetch]
└─$ figlet "Welcome" | lolcat
__        __   _
\ \      / /__| | ___ ___  _ __ ___   ___
└─$: command not found
KolobMobile: command not found
-bash: syntax error near unexpected token `kolob㉿ChefZentralle'
└─$: command not found
__: command not found
-bash: syntax error near unexpected token `|'
>
┌──(kolob㉿ChefZentralle)-[~/neofetch]
└─$
clear
echo "KolobMobile Activated" | lolcat
figlet "Welcome" | lolcat
clear
echo "KolobMobile Activated" | lolcat
figlet "Welcome" | lolcat
cp "/mnt/c/Users/kolob/Desktop/Scripts/kolobmobile-grafik.txt" ~/.kolob-banner.txt
nano ~/.zshrc
┏━(Message from Kali developers)
┃
┃ This is a minimal installation of Kali Linux, you likely
┃ want to install supplementary tools. Learn how:
┃ ⇒ https://www.kali.org/docs/troubleshooting/common-minimum-setup/
┃
┗━(Run: “touch ~/.hushlogin” to hide this message)
┌──(kolob㉿ChefZentralle)-[~]
└─$
source ~/.zshrc
figlet -f small "KolobMobile" | lolcat
echo "KolobMobile Activated" | lolcat -a -d 5
sudo gem uninstall lolcat
git clone https://github.com/busyloop/lolcat.git
cd lolcat/bin
sudo cp lolcat /usr/local/bin
echo "KolobMobile Activated" | lolcat -a -d 5
figlet -f small "KolobMobile" | lolcat
cat ~/.kolob-banner.txt | lolcat -s 0.5 -F 0.1
sudo rm /usr/local/bin/lolcat
sudo apt install ruby ruby-dev -y
sudo gem install lolcat
echo "KolobMobile Activated" | lolcat -a -d 2
pv ~/.kolob-banner.txt | lolcat
pv -qL 20 ~/.kolob-banner.txt | lolcat
pv -qL 50 ~/.kolob-banner.txt | lolcat
nano ~/.kolob-banner.sh
chmod +x ~/.kolob-banner.sh
nano ~/.zshrc
nano ~/.bashrc
~/.kolob-banner.txt
nano ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
pv ~/.kolob-banner.txt | lolcat
sudo apt install pv -y
pv ~/.kolob-banner.txt | lolcat
cat ~/.kolob-banner.txt
pv ~/.kolob-banner.txt | lolcat
nano ~/.kolob-banner.sh
chmod +x ~/.kolob-banner.sh
echo "bash ~/.kolob-banner.sh" >> ~/.zshrc
source ~/.zshrc
echo "bash ~/.kolob-banner.sh" >> ~/.bashrc
source ~/.bashrc
chmod +x ~/.kolob-banner.sh grep kolob-banner ~/.bashrc ~/.zshrc
nano ~/.kolob-banner.sh
grep kolob-banner ~/.bashrc ~/.zshrc
cat ~/.kolob-banner.sh
cat ~/.kolob-banner.txt
rm ~/.kolob-banner.txt
nano ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
┌──(kolob㉿ChefZentralle)-[~]
└─$ cat ~/.kolob-banner.txt
cat: /home/kolob/.kolob-banner.txt: No such file or directory
rm ~/.kolob-banner.txt
nano ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
nano ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
echo "bash ~/.kolob-banner.sh" >> ~/.bashrc && source ~/.bashrc
nano ~/.kolob-banner.txt
cargo install ascii-art-generator
ascii-art-generator my.png --width $(tput cols)   > ~/.kolob-banner.txt
sudo apt install cargo
sudo apt install rustup
cols=$(tput cols)
fold -w $((cols-2)) ~/.kolob-banner.txt   > tmp && mv tmp ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
bash ~/.kolob-banner.sh
cat ~/.kolob-banner.txt
nano ~/.kolob-banner.txt
cat ~/.kolob-banner.txt
cat ~/.kolob-banner.txt | sed -n '1,5p'
nano ~/.kolob-banner.sh
chmod +x ~/.kolob-banner.sh
echo "bash ~/.kolob-banner.sh" >> ~/.zshrc && source ~/.zshrc
cargo install ascii-art-generator
ascii-art-generator my.png --width $(tput cols)   > ~/.kolob-banner.txt
sudo apt install caca-utils
cols=$(tput cols)
img2txt --width=$((cols-4)) my.png   > ~/.kolob-banner.txt
cols=$(tput cols)
fold -w $((cols-2)) ~/.kolob-banner.txt   > tmp && mv tmp ~/.kolob-banner.txt
KolobMobile System Loaded
Hostname: ChefZentralle
IP: 172.22.185.252
Date: 2025-06-26 13:32:36
Wi-Fi Check:
/home/kolob/wifi-check.sh: line 3: nmcli: command not found
┌──(kolob㉿ChefZentralle)-[~]
└─$
nano ~/wifi-check.sh
chmod +x ~/wifi-check.sh
bash ~/.kolob-banner.sh
nano ~/wifi-check.sh
nano ~/.kolob-banner.sh
cat <<'EOF' > ~/wifi-check.sh
#!/bin/bash
nmcli -t -f ACTIVE,SSID,DEVICE dev wifi | grep '^yes' | awk -F: '{print $2 " on " $3}'
EOF

chmod +x ~/wifi-check.sh
nano ~/wifi-check.sh
chmod +x ~/wifi-check.sh
nano ~/.kolob-banner.sh
chmod +x ~/.kolob-banner.sh
sudo apt install jp2a caca-utils lolcat wireless-tools network-manager
echo "bash ~/.kolob-banner.sh" >> ~/.bashrc && source ~/.bashrc
cat ~/.kolob-banner.txt
nano ~/.kolob-banner.sh
chmod +x ~/wifi-check.sh
mv ~/wifi-check.sh ~/network-check.sh
chmod +x ~/network-check.sh
nano ~/.kolob-banner.sh
chmod +x ~/network-check.sh
mv ~/wifi-check.sh ~/network-check.sh
chmod +x ~/network-check.sh
┌──(kolob㉿ChefZentralle)-[~]
└─$ mv ~/wifi-check.sh ~/network-check.sh
chmod +x ~/network-check.sh
mv: cannot stat '/home/kolob/wifi-check.sh': No such file or directory
nano ~/network-check.sh
chmod +x ~/network-check.sh
nano ~/.kolob-banner.sh
chmod +x ~/.kolob-banner.sh
echo "bash ~/.kolob-banner.sh" >> ~/.bashrc && source ~/.bashrc
# или для Zsh:
echo "bash ~/.kolob-banner.sh" >> ~/.zshrc  && source ~/.zshrc
bash ~/.kolob-banner.sh
KolobMobile System Loaded
Hostname: ChefZentralle
IP: 172.22.185.252
Date: 2025-06-26 13:51:15
Network Check:
Network: Ethernet • 172.22.185.252/20 on eth0
┌──(kolob㉿ChefZentralle)-[~]
└─$
ls -l ~/.kolob-banner.txt
head -n 5 ~/.kolob-banner.txt
ls -l ~/.kolob-banner.txt
head -n 5 ~/.kolob-banner.txt
ls -l ~/.kolob-banner.txt
head -n 5 ~/.kolob-banner.txt
nano ~/.kolob-banner.sh
cp /mnt/c/Users/kolob/kolob-banner.png ~/kolob-banner.png
nano ~/.kolob-banner.txt
nano ~/.kolob-banner.sh
nano ~/.kolob-banner.txt
mv "C:\Users\kolob\kolob-banner.png" ~/kolob-banner.png
cp /mnt/c/Users/kolob/Pictures/kolob-banner.png ~/kolob-banner.png
cp /mnt/C/Users/kolob/kolob-banner.png ~/kolob-banner.png
ls /mnt/c/Users/kolob
cp /mnt/c/Users/kolob/kolob-banner.png ~/kolob-banner.png
ls -lh ~/kolob-banner.png
# размер должен быть >0, а в типе – png
bash ~/.kolob-banner.sh
p10k configure
apt installl Powerlevel10k -y
edit ~/.p10k.zsh
suddo apt installl Powerlevel10k -y
sudo apt installl Powerlevel10k -y
sudo apt install mailcap
mailcap
sudo apt installl Powerlevel10k -y
cd C:\Users\kolob\Desktop\Scripts\wifi-hack.sh
nano ~/.kolob-banner.txt
p10k configure
deb g10k
icu-devtools
nano ~/.zsh/p10k.sh
nano ~/.zsh/p10k
nano ~/.zsh/powerlevel10k
ls
cd..
cd .zsh
ls
lr
ls
edit ~/.p10k.zsh
edit ~/.p10k.bash
edit ~/.p10k.zsh
p10k configure
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git sudo z extract)
source $ZSH/oh-my-zsh.sh
alias ll='ls -alF'
alias gs='git status'
alias updateall='sudo apt update && sudo apt upgrade -y'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git sudo z extract)
source $ZSH/oh-my-zsh.sh
alias ll='ls -alF'
alias gs='git status'
alias updateall='sudo apt update && sudo apt upgrade -y'
sudo apt installl powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
p10k configure
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
cd ..
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
ZSH_THEME="powerlevel10k/powerlevel10k" export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git sudo z extract)
source $ZSH/oh-my-zsh.sh
alias ll='ls -alF'
alias gs='git status'
alias updateall='sudo apt update && sudo apt upgrade -y'
-bash: /home/kolob/.oh-my-zsh/oh-my-zsh.sh: No such file or directory
alias updateall='sudo apt update && sudo apt upgrade -y'
ZSH_THEME="powerlevel10k/powerlevel10k" export ZSH="$HOME/.oh-my-zsh"
p10k configure
scp user@ubuntu:~/.p10k.zsh ~
scp user@ubuntu:~/.zshrc ~
┌──(kolob㉿ChefZentralle)-[~]
└─$ scp user@ubuntu:~/.p10k.zsh ~
scp user@ubuntu:~/.zshrc ~
ssh: Could not resolve hostname ubuntu: Temporary failure in name resolution
scp: Connection closed
ssh: Could not resolve hostname ubuntu: Temporary failure in name resolution
scp: Connection closed
┌──(kolob㉿ChefZentralle)-[~]
└─$scp user@ubuntu:~/.p10k.zsh ~
scp user@ubuntu:~/.zshrc ~
ip a | grep inet
scp ~/.zshrc ~/.p10k.zsh kolob@172.22.185.252:~
powerlevel10k
./sync-zsh-from-ubuntu.sh
p10k configure
nano ~/sync-zsh-from-ubuntu.sh
chmod +x ~/sync-zsh-from-ubuntu.sh
./sync-zsh-from-ubuntu.sh
explorer.exe .
