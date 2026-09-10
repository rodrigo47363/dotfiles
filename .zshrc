# ==============================================================================
# 1. POWERLEVEL10K INSTANT PROMPT (DEBE SER LO PRIMERO)
# ==============================================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================================
# 2. VARIABLES DE ENTORNO (EXPORTS)
# ==============================================================================
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/sbin:$PATH"

# Pyenv Configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# ==============================================================================
# 3. CONFIGURACIÓN DE HISTORIAL (OPSEC & CAPACIDAD)
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=50000        # Aumentado para conservar comandos de auditoría de meses
SAVEHIST=50000

# Opciones nativas de Zsh para manejo de comandos
setopt HIST_IGNORE_SPACE      # NO guarda comandos que inicien con un espacio (Crucial OpSec)
setopt HIST_IGNORE_ALL_DUPS   # Elimina duplicados previos si el comando nuevo es igual
setopt HIST_SAVE_NO_DUPS      # No escribe duplicados en el archivo de disco
setopt HIST_REDUCE_BLANKS     # Elimina espacios en blanco innecesarios
setopt SHARE_HISTORY          # Comparte historial entre terminales activas simultáneamente
setopt AUTO_CD                # Escribir solo la ruta cambia de directorio automáticamente

# ==============================================================================
# 4. INICIALIZACIÓN DE ENTORNOS (SILENCIADOS PARA P10K)
# ==============================================================================
# Pywal
if command -v cat &> /dev/null && [ -f ~/.cache/wal/sequences ]; then
  (cat ~/.cache/wal/sequences &)
fi

# Pyenv init
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  if pyenv help virtualenv-init >/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# ==============================================================================
# 5. AUTOCOMPLETADO OPTIMIZADO
# ==============================================================================
# Eliminado el prompt adam1 que colisionaba con p10k
bindkey -e

# Compinit con verificación de caché de 24 horas para mitigar lag
autoload -Uz compinit
if [ $(date +%j) != $(stat -c '%Y' ~/.zcompdump 2>/dev/null | date +%j) ]; then
  compinit
else
  compinit -C
fi

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

# ==============================================================================
# 6. ALIASES
# ==============================================================================
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

# ==============================================================================
# 7. FUNCIONES DE PENTESTING
# ==============================================================================
function mkt() {
    if [ -z "$1" ]; then
        echo -e "\n[!] Uso: mkt <nombre_objetivo o IP>\n"
        return 1
    fi
    mkdir -p "$1"/{nmap,content,exploits,scripts,privesc}
    cd "$1" || return
    echo -e "\n[*] Entorno creado y posicionado en: $(pwd)\n"
}

function extractPorts() {
    if [ ! -f "$1" ]; then
        echo -e "\n[!] Error: Fichero no encontrado.\n"
        return 1
    fi
    ports="$(grep -oP '\d{1,5}/open' "$1" | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' "$1" | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo "$ports" | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    command cat extractPorts.tmp 
    rm extractPorts.tmp
}

function settarget() {
    if [ $# -eq 1 ]; then
        echo "$1" > ~/.config/bin/target
        echo -e "[+] Objetivo configurado: \033[1;32m$1\033[0m"
    elif [ $# -eq 2 ]; then
        echo "$1 $2" > ~/.config/bin/target
        echo -e "[+] Objetivo configurado: \033[1;32m$1\033[0m ($2)"
    else
        echo "Uso: settarget [IP] [NOMBRE] | settarget [IP]"
    fi
}

function cleartarget() {
    > ~/.config/bin/target
    echo "[-] Objetivo limpiado."
}

alias settgt="settarget"
alias cleartgt="cleartarget"

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

# Corregido: Optimizada la remoción forense (Se prefiere shred con iteraciones balanceadas)
function rmk() {
    if [ -z "$1" ]; then
        echo -e "\n[!] Uso: rmk <archivo>\n"
        return 1
    fi
    if command -v shred >/dev/null 2>&1; then
        shred -zun 3 -v "$1" # 3 pasadas son suficientes según estándares NISPOM/NIST modernos para sobrescritura
    else
        scrub -p dod -f "$1"
    fi
}

# ==============================================================================
# 8. PLUGINS Y TEMAS (DEBEN IR JUNTOS ANTES DEL FINALIZADOR)
# ==============================================================================
if command -v thefuck >/dev/null 2>&1; then
    eval "$(thefuck --alias)"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-sudo/sudo.plugin.zsh ] && source /usr/share/zsh-sudo/sudo.plugin.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ] && source ~/.powerlevel10k/powerlevel10k.zsh-theme

# ==============================================================================
# 9. POWERLEVEL10K FINALIZE (DEBE SER ABSOLUTAMENTE LO ÚLTIMO)
# ==============================================================================
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.cargo/bin:$PATH"
