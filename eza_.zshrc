# ==============================================================================
# 1. POWERLEVEL10K INSTANT PROMPT (DEBE SER LO PRIMERO)
# ==============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 2. VARIABLES DE ENTORNO (EXPORTS)
# ==============================================================================
# Fix para GUIs de Java (Burp Suite, Ghidra) en tiling WMs
export _JAVA_AWT_WM_NONREPARENTING=1

# PATH configuration
export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/sbin:$PATH"

# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# ==============================================================================
# 3. INICIALIZACIÓN DE ENTORNOS (SILENCIADOS PARA P10K)
# ==============================================================================
# Pywal
if command -v cat &> /dev/null && [ -f ~/.cache/wal/sequences ]; then
  (cat ~/.cache/wal/sequences &)
fi

# Pyenv init
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  # Silenciar virtualenv-init para evitar el error de P10k
  if pyenv help virtualenv-init >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# ==============================================================================
# 4. CONFIGURACIÓN DE ZSH, ALIAS Y FUNCIONES
# ==============================================================================
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory
setopt autocd
bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Autocompletado
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Alias eza
alias l='eza -1 --group-directories-first'
alias ll='eza -lh --group-directories-first'
alias la='eza -a --group-directories-first'
alias lla='eza -lha --group-directories-first'
alias ls='eza --group-directories-first'
alias lt='eza --tree --level=2 --group-directories-first'
alias ltg='eza --tree --level=2 --git-ignore --group-directories-first'

# Alias bat
alias cat='batcat --paging=never --style=plain'
alias catn='batcat --paging=never --style=plain'
alias catnl='batcat'
alias catp='batcat --style=header,grid'

# Keybindings
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Funciones de Pentesting
function mkt() {
    mkdir -p {nmap,content,exploits,scripts}
}

function extractPorts() {
    ports="$(grep -oP '\d{1,5}/open' "$1" | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' "$1" | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo "$ports" | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    command cat extractPorts.tmp # Usa el binario real, no el alias 'cat' de batcat
    rm extractPorts.tmp
}

function settarget() {
    if [ $# -eq 1 ]; then
        echo "$1" > ~/.config/bin/target
    elif [ $# -gt 2 ]; then
        echo "settarget [IP] [NAME] | settarget [IP]"
    else
        echo "$1 $2" > ~/.config/bin/target
    fi
}

function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

function fzf-lovely() {
    if [ "$1" = "h" ]; then
        fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (batcat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
    else
        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (batcat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
    fi
}

function rmk() {
    scrub -p dod "$1"
    shred -zun 10 -v "$1"
}

# ==============================================================================
# 5. PLUGINS Y TEMAS
# ==============================================================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-sudo/sudo.plugin.zsh ] && source /usr/share/zsh-sudo/sudo.plugin.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ] && source ~/.powerlevel10k/powerlevel10k.zsh-theme

# ==============================================================================
# 6. POWERLEVEL10K FINALIZE (DEBE SER ABSOLUTAMENTE LO ÚLTIMO)
# ==============================================================================
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
