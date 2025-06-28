# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# === 🧠 Kolob ZSH Setup ===

# Путь до Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Тема: Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Плагины — минимум, строго то, что нужно
plugins=(git sudo z extract)

# Запуск Oh My Zsh
source $ZSH/oh-my-zsh.sh

# === Алиасы ===
alias ll='ls -alF'
alias gs='git status'
alias updateall='sudo apt update && sudo apt upgrade -y'
alias ..='cd ..'
alias ...='cd ../..'
alias k='clear && echo -e "\n🚀 Launching Kolob...\n" && bash ~/kolob-wifi.sh --auto'
alias check='bash ~/kolob-hw-check.sh'

# === Powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# === Автодополнение и подсветка ===
[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# === KolobMobile запуск при входе ===
if [[ -x ~/kolob-wifi.sh ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
  bash ~/kolob-wifi.sh --auto
fi

# === Добро пожаловать ===
kolob_ascii() {
  echo -e "\n\e[1;35m"
  cat << "EOF"
 _  __     _       _     __  __       _     _ _       
| |/ /    | |     | |   |  \/  |     | |   (_) |      
| ' / ___ | | ___ | |__ | \  / | ___ | |__  _| | ___  
|  < / _ \| |/ _ \| '_ \| |\/| |/ _ \| '_ \| | |/ _ \ 
| . \ (_) | | (_) | |_) | |  | | (_) | |_) | | |  __/ 
|_|\_\___/|_|\___/|_.__/|_|  |_|\___/|_.__/|_|_|\___|  
     🧠⚡ K O L O B M O B I L E   I N I T I A L I Z E D
EOF
  echo -e "\e[0m"
}
kolob_ascii
