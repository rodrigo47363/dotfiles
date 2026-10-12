# ==============================================================================
# 1. UNDERCOVER ENGINE & P10K INSTANT PROMPT
# ==============================================================================
if [[ -f ~/.config/polybar/current_mode ]] && grep -Eq "^(win10|win11)$" ~/.config/polybar/current_mode; then
  export IS_WINDOWS_UNDERCOVER=1
else
  export IS_WINDOWS_UNDERCOVER=0
fi

if [[ "$IS_WINDOWS_UNDERCOVER" -eq 0 ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

# ==============================================================================
# 2. ENTORNO, RUTAS Y OPTIMIZACIÓN DE PATH (DEDUPLICACIÓN AUTOMÁTICA)
# ==============================================================================
# Evita rutas duplicadas en PATH dentro de cualquier subshell
typeset -U path PATH

export _JAVA_AWT_WM_NONREPARENTING=1
export AGY_CLI_HIDE_ACCOUNT_INFO=true
export PNPM_HOME="$HOME/.local/share/pnpm"
export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"

# Consolidación ordenada de binarios de desarrollo, pentest y sistema
path=(
  $HOME/.local/bin
  $HOME/bin
  $HOME/go/bin
  $HOME/.cargo/bin
  $HOME/.pdtm/go/bin
  $PNPM_HOME
  $PYENV_ROOT/bin
  $NVM_DIR/versions/node/v22.23.1/bin
  /usr/local/sbin
  /usr/local/bin
  /usr/sbin
  /usr/bin
  /sbin
  /bin
  $path
)

# ==============================================================================
# 3. HISTORIAL TÁCTICO & OPSEC (AUDITORÍAS Y RED TEAM)
# ==============================================================================
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY       # Guarda marcas de tiempo exactas y duración (vital para reportes de auditoría)
setopt HIST_IGNORE_SPACE      # No guarda comandos que inicien con un espacio (OpSec para credenciales)
setopt HIST_IGNORE_ALL_DUPS   # Si un comando nuevo es idéntico a uno previo, elimina el duplicado
setopt HIST_SAVE_NO_DUPS      # No escribe comandos duplicados al disco
setopt HIST_EXPIRE_DUPS_FIRST # Al llenarse el buffer, purga duplicados antiguos primero
setopt HIST_FIND_NO_DUPS      # No muestra duplicados al buscar en el historial
setopt HIST_REDUCE_BLANKS     # Sanitiza espacios en blanco innecesarios
setopt HIST_VERIFY            # Permite revisar expansiones de historial (!$, !!) antes de ejecutarlas
setopt SHARE_HISTORY          # Comparte historial entre terminales activas de manera ordenada
setopt AUTO_CD                # Escribir solo una ruta válida cambia de directorio automáticamente
setopt AUTO_PUSHD             # Permite navegar hacia atrás/adelante en el historial de directorios (cd -)
setopt PUSHD_IGNORE_DUPS      # Evita duplicados en la pila de directorios
setopt PUSHD_SILENT           # Silencia la salida interna de pushd

# ==============================================================================
# 4. COLOR SYNC & PYWAL INTEGRATION
# ==============================================================================
if command -v cat >/dev/null 2>&1 && [[ -f ~/.cache/wal/sequences ]]; then
  (cat ~/.cache/wal/sequences &)
fi

# ==============================================================================
# 5. LAZY LOADING DE RUNTIMES (0ms STARTUP LAG)
# ==============================================================================
# NVM Lazy-Loader: evita el delay de ~300-500ms al abrir cada pestaña o ventana
if [[ -d "$NVM_DIR" ]]; then
  _load_nvm() {
    unset -f nvm node npm npx pnpm yarn 2>/dev/null
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
  }
  nvm() { _load_nvm; nvm "$@"; }
fi

# Pyenv Fast-Check
if [[ -d "$PYENV_ROOT" ]] && command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path 2>/dev/null)"
  eval "$(pyenv init - 2>/dev/null)"
fi

# ==============================================================================
# 6. AUTOCOMPLETADO OPTIMIZADO (COMPINIT SIN SUBPROCESOS LENTOS)
# ==============================================================================
autoload -Uz compinit
# Caché de 24 horas usando globbing nativo de Zsh (cero forks de procesos externos)
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Estilos visuales del completado
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
eval "$(dircolors -b 2>/dev/null)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- No se encontraron coincidencias --%f'
zstyle ':completion:*:default' select-prompt '%SSelección activa: %p%s'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Autosuggestions Tuning (Gris tenue acorde a OneDark/Kitty)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#5c6370'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ==============================================================================
# 7. KEYBINDINGS ERGONÓMICOS
# ==============================================================================
bindkey -e
# Búsqueda de historial interactiva basada en prefijo con flechas arriba/abajo
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^H' backward-kill-word

# ==============================================================================
# 8. FZF & BAT VISUAL STYLING
# ==============================================================================
export FZF_DEFAULT_OPTS=" \
--color=bg+:#282c34,bg:#1e222a,spinner:#61afef,hl:#e06c75 \
--color=fg:#abb2bf,header:#e06c75,info:#98c379,pointer:#61afef \
--color=marker:#e5c07b,fg+:#dcdfe4,prompt:#c678dd,hl+:#e06c75 \
--layout=reverse \
--border=rounded \
--height=50% \
--info=inline"

# Alias de bat / batcat adaptativos
if command -v batcat >/dev/null 2>&1; then
  alias bat='batcat'
  alias cat='batcat --paging=never --style=plain'
  alias catn='batcat --paging=never --style=plain'
  alias catnl='batcat'
  alias catp='batcat --style=header,grid'
elif command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never --style=plain'
  alias catn='bat --paging=never --style=plain'
  alias catnl='bat'
  alias catp='bat --style=header,grid'
fi

# ==============================================================================
# 9. ALIASES MODERNOS & OPERATIVOS
# ==============================================================================
# Eza (con soporte para iconos NerdFont y directorios ordenados)
alias l='eza -1 --icons --group-directories-first'
alias ll='eza -lh --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lla='eza -lha --icons --group-directories-first'
alias ls='eza --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons --group-directories-first'
alias ltg='eza --tree --level=2 --git-ignore --icons --group-directories-first'

# Navegación rápida y ergonomía
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias mkdir='mkdir -pv'
alias sudo='sudo '
alias histg='history 1 | grep'

# Red y utilidades del sistema
alias ports='ss -tulpn'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c'
alias cls='clear'

# ==============================================================================
# 10. TOOLING & FUNCIONES OFENSIVAS DE PENTESTING
# ==============================================================================
# Crea estructura modular para auditorías o máquinas de CTFs
function mkt() {
    if [[ -z "$1" ]]; then
        print -P "%F{yellow}[!] Uso:%f mkt <nombre_objetivo_o_IP>"
        return 1
    fi
    mkdir -p "$1"/{nmap,content,exploits,scripts,privesc}
    cd "$1" || return 1
    print -P "\n%F{green}[+]%f Entorno estructurado en: %B%F{cyan}$(pwd)%f%b"
    eza --tree --level=1 --icons --group-directories-first 2>/dev/null
}

# Parsea puertos abiertos de un escaneo de Nmap (normal o grepable) en memoria
function extractPorts() {
    if [[ ! -f "$1" ]]; then
        print -P "\n%F{red}[!] Error: Archivo no encontrado.%f\nUso: extractPorts <allPorts.gnmap | scan.txt>\n"
        return 1
    fi

    local ip_address
    local ports
    ip_address="$(grep -oP '\b(?:\d{1,3}\.){3}\d{1,3}\b' "$1" | sort -u | head -n 1)"
    ports="$(grep -oP '\d{1,5}/open' "$1" | cut -d '/' -f 1 | paste -sd ',' -)"

    if [[ -z "$ports" ]]; then
        print -P "\n%F{yellow}[!] No se detectaron puertos abiertos en el archivo especificado.%f\n"
        return 1
    fi

    print -P "\n%F{blue}[*]%f %BExtrayendo información de puertos...%b\n"
    [[ -n "$ip_address" ]] && print -P "\t%F{cyan}[*]%f %BIP Address:%b  %F{green}$ip_address%f"
    print -P "\t%F{cyan}[*]%f %BOpen ports:%b  %F{yellow}$ports%f\n"

    if command -v xclip >/dev/null 2>&1; then
        print -n "$ports" | xclip -sel clip
        print -P "%F{green}[+] Puertos copiados al portapapeles (xclip).%f\n"
    elif command -v wl-copy >/dev/null 2>&1; then
        print -n "$ports" | wl-copy
        print -P "%F{green}[+] Puertos copiados al portapapeles (wl-copy).%f\n"
    fi
}

# Configuración y consulta de Target para Polybar / Scripts
function settarget() {
    local target_dir="$HOME/.config/bin"
    [[ ! -d "$target_dir" ]] && mkdir -p "$target_dir"

    if [[ $# -eq 1 ]]; then
        echo "$1" > "$target_dir/target"
        print -P "%F{green}[+]%f Objetivo configurado: %B%F{cyan}$1%f%b"
    elif [[ $# -eq 2 ]]; then
        echo "$1 $2" > "$target_dir/target"
        print -P "%F{green}[+]%f Objetivo configurado: %B%F{cyan}$1%f%b (%F{yellow}$2%f)"
    else
        print -P "%F{yellow}[!] Uso:%f settarget <IP> [NOMBRE] | settarget <IP>"
        return 1
    fi
}

function cleartarget() {
    local target_file="$HOME/.config/bin/target"
    if [[ -f "$target_file" ]]; then
        : > "$target_file"
        print -P "%F{red}[-]%f Objetivo limpiado exitosamente."
    fi
}

function target() {
    local target_file="$HOME/.config/bin/target"
    if [[ -s "$target_file" ]]; then
        local ip name
        ip=$(awk '{print $1}' "$target_file" 2>/dev/null)
        name=$(awk '{print $2}' "$target_file" 2>/dev/null)
        if [[ -n "$name" ]]; then
            print -P "%F{cyan}[*] Target activo:%f %B%F{green}$ip%f%b (%F{yellow}$name%f)"
        else
            print -P "%F{cyan}[*] Target activo:%f %B%F{green}$ip%f%b"
        fi
    else
        print -P "%F{yellow}[*] No hay ningún target activo.%f (Usa: settarget <IP> [NOMBRE])"
    fi
}

alias settgt="settarget"
alias cleartgt="cleartarget"
alias tgt="target"

# Detección táctica del Sistema Operativo mediante TTL (ICMP)
function whichSystem() {
    local target="${1:-$(awk '{print $1}' ~/.config/bin/target 2>/dev/null)}"
    if [[ -z "$target" ]]; then
        print -P "%F{yellow}[!] Uso:%f whichSystem <IP_or_Host> (o configura uno con settarget)"
        return 1
    fi

    local ttl
    ttl=$(ping -c 1 -W 1.5 "$target" 2>/dev/null | grep -oP 'ttl=\K\d+')

    if [[ -z "$ttl" ]]; then
        print -P "%F{red}[!] Host inaccesible o bloqueando paquetes ICMP (%F{yellow}$target%F{red})%f"
        return 1
    fi

    local os="Desconocido"
    if (( ttl <= 64 )); then
        os="Linux / Unix"
    elif (( ttl <= 128 )); then
        os="Windows"
    elif (( ttl <= 255 )); then
        os="Solaris / Cisco"
    fi

    print -P "%F{cyan}[*]%f %BHost:%b %F{white}$target%f | %BTTL:%b %F{yellow}$ttl%f -> %BOS Estimado:%b %F{green}$os%f"
}

# Consulta rápida de IP local y VPN con opción de copia
function vpnip() {
    local ip
    ip=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    if [[ -n "$ip" ]]; then
        print -P "%F{green}[*] VPN (tun0):%f %B%F{cyan}$ip%f%b"
        if [[ "$1" == "-c" ]] && command -v xclip >/dev/null 2>&1; then
            print -n "$ip" | xclip -sel clip
            print -P "%F{green}[+] IP copiada al portapapeles.%f"
        fi
    else
        print -P "%F{red}[!] Interfaz tun0 inactiva (Sin conexión VPN)%f"
    fi
}

function myip() {
    local ip_lan ip_tun
    ip_lan=$(ip -4 addr show scope global | grep -v 'tun0' | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
    ip_tun=$(ip -4 addr show tun0 2>/dev/null | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

    [[ -n "$ip_lan" ]] && print -P "%F{cyan}[*] LAN IP:%f %B$ip_lan%b"
    [[ -n "$ip_tun" ]] && print -P "%F{green}[*] VPN IP (tun0):%f %B%F{green}$ip_tun%f%b"
}

# Visor de páginas man con sintaxis y resaltado cromático
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

# Buscador interactivo difuso con vista previa inteligente
function fzf-lovely() {
    local preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (batcat --style=numbers --color=always {} 2>/dev/null || bat --style=numbers --color=always {} 2>/dev/null || cat {}) | head -500'
    if [[ "$1" == "h" ]]; then
        fzf -m --reverse --preview-window down:20 --preview "$preview_cmd"
    else
        fzf -m --preview "$preview_cmd"
    fi
}

# Borrado seguro forense con sobrescritura (shred / scrub)
function rmk() {
    if [[ -z "$1" ]]; then
        print -P "%F{yellow}[!] Uso:%f rmk <archivo_o_patron>"
        return 1
    fi
    if command -v shred >/dev/null 2>&1; then
        shred -zun 3 -v "$1"
    else
        scrub -p dod -f "$1"
    fi
}

# ==============================================================================
# 11. PLUGINS DEL ECOSISTEMA ZSH
# ==============================================================================
# Integración de utilidades
if command -v thefuck >/dev/null 2>&1; then
    eval "$(thefuck --alias 2>/dev/null)"
fi
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# Plugins del sistema en orden estricto de carga
[[ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]] && source /usr/share/zsh-sudo/sudo.plugin.zsh
[[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Sintaxis destacada: SIEMPRE debe cargarse después de los otros plugins
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==============================================================================
# 12. GESTIÓN DEL ENTORNO VISUAL: UNDERCOVER ENGINE O POWERLEVEL10K
# ==============================================================================
if [[ "$IS_WINDOWS_UNDERCOVER" -eq 1 ]]; then
    # MODO UNDERCOVER: SIMULACIÓN DE WINDOWS POWERSHELL
    setopt prompt_subst

    win_pwd() {
        local p="$PWD"
        p="${p/#$HOME/C:\\Users\\$USER}"
        p="${p//\//\\}"
        print -r -- "$p"
    }

    export PROMPT='%F{cyan}PS %F{white}$(win_pwd)%F{white}> %f'
    export RPROMPT=''

    alias dir='ls -lah --color=auto'
    alias ipconfig='ip -c a'
    alias systeminfo='fastfetch 2>/dev/null || uname -a'
    alias md='mkdir -p'
    alias rd='rmdir'
    alias type='cat'
    alias move='mv'
    alias copy='cp'
    alias del='rm -i'
    alias tasklist='ps aux'
    alias taskkill='kill'
    alias start='xdg-open'
    alias powershell='clear && echo -e "Windows PowerShell\nCopyright (C) Microsoft Corporation. All rights reserved.\n"'

    if [[ -o interactive ]] && [[ -z "$WIN_SHELL_INITIALIZED" ]]; then
        export WIN_SHELL_INITIALIZED=1
        echo "Windows PowerShell"
        echo "Copyright (C) Microsoft Corporation. All rights reserved."
        echo ""
        echo "Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows"
        echo ""
    fi
else
    # ENTORNO ESTÁNDAR: POWERLEVEL10K TÁCTICO
    [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
    [[ -f ~/.powerlevel10k/powerlevel10k.zsh-theme ]] && source ~/.powerlevel10k/powerlevel10k.zsh-theme
    (( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
fi
