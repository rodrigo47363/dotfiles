# ⚙️ Dotfiles — Entorno de Desarrollo y Pentesting (Cross-Platform)

![Dotfiles Preview](Example1.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS: Linux | Windows](https://img.shields.io/badge/OS-Parrot%20%7C%20Kali%20%7C%20Windows-blue)](https://parrotsec.org/)
[![Status: Active](https://img.shields.io/badge/Status-Active-success)]()

## 🧩 Descripción

Repositorio personal diseñado para **personalizar, automatizar y optimizar** entornos de seguridad ofensiva y desarrollo multiplataforma. 
Construido y auditado para distribuciones orientadas al pentesting (Parrot OS / Kali Linux) usando **BSPWM, Sxhkd, Polybar y Rofi**, e incluye perfiles optimizados para PowerShell en Windows.

Este entorno prioriza la eficiencia, el uso de atajos de teclado y la automatización de tareas que no agregan valor analítico en auditorías.

---

## 🛡️ OPSEC y Seguridad del Repositorio

Como profesional de la seguridad, la protección de credenciales es primordial. 
* **Regla Zero-Trust:** Asegúrate de no incluir claves privadas, tokens de API, historiales de Bash (`.bash_history`) o archivos `.rar` con información personal en los commits.
* Si clonas este repositorio, utiliza un `.gitignore` robusto para excluir archivos de volcado o copias de seguridad locales (ej. `echo "*.rar" >> .gitignore`).

---

## 🚀 Inicio Rápido

El repositorio cuenta con un script de arranque seguro (`bootstrap.sh`) que genera los enlaces simbólicos (symlinks) necesarios sin destruir tus configuraciones previas de forma inadvertida.

```bash
# 1. Clonar el repositorio
git clone [https://github.com/rodrigo47363/dotfiles.git](https://github.com/rodrigo47363/dotfiles.git) ~/dotfiles
cd ~/dotfiles

# 2. Asignar permisos de ejecución e instalar
chmod +x bootstrap.sh
./bootstrap.sh --minimal

```

---

## 🧰 Dependencias del Entorno (Debian/Parrot/Kali)

Para replicar el entorno al 100%, instala los siguientes paquetes base y herramientas de auditoría. *(Nota: Algunas herramientas modernas como `fastfetch` pueden requerir instalación vía GitHub Releases si tu repositorio APT está desactualizado).*

```bash
sudo apt update -y && sudo apt install -y \
    xinput git curl wget zsh unzip build-essential cmake pkg-config meson \
    kitty tmux neovim jq bat locate ranger xclip scrub acpi brightnessctl wmname \
    bspwm sxhkd rofi picom feh scrot imagemagick \
    libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-ewmh-dev \
    libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto \
    libxcb-image0-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev \
    libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev \
    libmpdclient-dev libuv1-dev libnl-genl-3-dev \
    openvpn aircrack-ng airgeddon hcxdumptool hcxtools \
    php ruby python3-sphinx zsh-syntax-highlighting zsh-autosuggestions \
    texlive-latex-recommended cmatrix nmcli golang hashcat seclists wordlists \
    && sudo updatedb

```

---

## 🎨 Selector Dinámico de Temas (Rofi)

Este entorno incluye un script avanzado en Bash (`theme-selector.sh`) que inyecta configuraciones de Rofi al vuelo utilizando `sed`, evitando la corrupción de archivos y manteniendo la persistencia de los temas.

### Requisitos y Despliegue

Para que el script de inyección funcione, la estructura de directorios en tu sistema local debe ser exacta.

**1. Inicializar la infraestructura (Si es una máquina nueva):**

```bash
mkdir -p ~/.config/rofi/themes
touch ~/.config/rofi/config.rasi

```

**2. Desplegar los archivos desde el repositorio:**
Copia los temas preservando sus atributos y permisos originales (`-p`):

```bash
cp -vp ~/dotfiles/rofi/*.rofi ~/.config/rofi/themes/
cp -vp ~/dotfiles/rofi/*.rasi ~/.config/rofi/themes/

```

**3. Ejecución:**

```bash
chmod +x ~/.config/rofi/themes/theme-selector.sh
~/.config/rofi/themes/theme-selector.sh

```

> **⚠️ Advertencia de Privilegios:** **NUNCA** ejecutes el selector de temas utilizando `sudo`. Modificar configuraciones de interfaz gráfica con privilegios elevados reasignará los inodos al superusuario, bloqueando el acceso de tu usuario estándar y corrompiendo la configuración de Rofi (Denegación de Servicio Local).

---

## 🔧 Fixes de Hardware (Touchpad)

En ciertos equipos portátiles (ej. Acer Nitro), el entorno BSPWM no levanta la configuración de *Tap-to-click* por defecto. Puedes solucionarlo inyectando esto en tu script de inicio (`bspwmrc`):

```bash
# Habilita el 'clic por toque'. 
# IMPORTANTE: Verifica el ID de tu touchpad usando el comando 'xinput list' (ej. ID 15)
xinput set-prop 15 "libinput Tapping Enabled" 1

```

---

## 📁 Estructura del Repositorio

Se prioriza el uso de configuraciones modulares. Si existen múltiples versiones de un layout (ej. `current.ini`), el `bootstrap.sh` enlazará automáticamente la iteración más reciente.

```text
.
├── .zshrc                        # Configuración principal de Zsh y alias ofensivos
├── sxhkdrc                       # Mapeo de atajos de teclado (Sxhkd / BSPWM)
├── rofi/                         # Entorno de Rofi
│   ├── theme-selector.sh         # Script inyector de configuración dinámica
│   ├── powermenu_alt.rasi        # UI del menú de apagado
│   └── themes/                   # Colección de archivos .rofi y .rasi
├── polybar/                      # Entorno de Polybar
│   ├── launch.sh                 # Script de arranque
│   ├── ethernet_status.sh        # Módulo de auditoría de red
│   └── layouts/                  # Variantes de visualización (12H / 24H)
├── powershell/                   # Perfiles unificados para entornos Windows
└── bootstrap.sh                  # Motor de instalación y symlinks

```

---

## 🖌️ Configuración de Polybar (Estilo Clásico Parrot OS)

Esta configuración es ideal si prefieres un entorno más limpio y unificado, manteniendo la estética clásica de Parrot OS. Dado que pasamos de un entorno multi-barra a una sola barra central, es crítico seguir el orden de inyección para no romper el entorno gráfico.

Aquí tienes la guía estructurada paso a paso:

### 1. Inyectar la configuración base (`~/.config/polybar/config.ini`)

Para evitar que un editor de texto (como Nano o Vim) corrompa los glifos y caracteres especiales de Nerd Fonts o FontAwesome, inyectaremos el código directamente desde la terminal usando `cat`.

Ejecuta el siguiente bloque de código completo en tu emulador de terminal:

```bash
cat << 'EOF' > ~/.config/polybar/config.ini
;==========================================================
;   POLYBAR CONFIG - CORRECCIÓN DE COLORES Y BOTÓN INVISIBLE
;==========================================================

[colors]
background = #2e3436
background-alt = #3b4252
foreground = #eceff4
primary = #81a1c1
red = #ff5555
green = #a3be8c
yellow = #ebcb8b
purple = #b48ead
cyan = #88c0d0
disabled = #707880

[bar/parrot]
width = 100%
height = 24pt
background = ${colors.background}
foreground = ${colors.foreground}
line-size = 3pt
padding-left = 1
padding-right = 1
module-margin = 1
separator = |
separator-foreground = ${colors.disabled}

wm-restack = bspwm

; --- FUENTES (He añadido FontAwesome como respaldo principal) ---
font-0 = "Cantarell:size=11;2"
font-1 = "Font Awesome 6 Free:style=Solid:size=11;2"
font-2 = "FontAwesome:size=11;2"
font-3 = "Symbols Nerd Font:size=12;3"

modules-left = bspwm xwindow
modules-right = filesystem pulseaudio memory cpu battery wlan eth date powermenu systray

cursor-click = pointer
enable-ipc = true

;==========================================================
; MÓDULO POWERMENU (Botón de Apagado - CORREGIDO)
;==========================================================
[module/powermenu]
type = custom/menu
expand-right = true

; El icono de apagado ahora tiene FONDO ROJO para que NO sea invisible
label-open = "    "
label-open-foreground = #ffffff
label-open-background = ${colors.red}
label-open-padding = 1

label-close = "  󰜺 cancelar  "
label-close-foreground = ${colors.foreground}
label-close-background = ${colors.background-alt}
label-separator = |

menu-0-0 = " Reiniciar "
menu-0-0-exec = systemctl reboot
menu-0-1 = " Apagar "
menu-0-1-exec = systemctl poweroff

;==========================================================
; MÓDULO BATERÍA
;==========================================================
[module/battery]
type = internal/battery
full-at = 98
low-at = 20
battery = BAT1
adapter = ACAD

format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>

label-charging = %percentage%%
label-discharging = %percentage%%
label-full = %{F#a3be8c}%{F-} %percentage%%

ramp-capacity-0 = %{F#ff5555}%{F-}
ramp-capacity-1 = %{F#ffb52a}%{F-}
ramp-capacity-2 = %{F#ffb52a}%{F-}
ramp-capacity-3 = %{F#a3be8c}%{F-}
ramp-capacity-4 = %{F#a3be8c}%{F-}

animation-charging-0 = %{F#a3be8c}%{F-}
animation-charging-1 = %{F#a3be8c}%{F-}
animation-charging-2 = %{F#a3be8c}%{F-}
animation-charging-3 = %{F#a3be8c}%{F-}
animation-charging-4 = %{F#a3be8c}%{F-}
animation-charging-framerate = 750

;==========================================================
; MÓDULO WLAN
;==========================================================
[module/wlan]
type = internal/network
interface = wlp0s20f3
interval = 5
format-connected = %{A1:~/.config/polybar/scripts/wifi-menu.sh:}%{F#81a1c1}%{F-} <label-connected>%{A}
label-connected = %essid%
format-disconnected = %{F#707880}%{F-} off

;==========================================================
; MÓDULO FECHA
;==========================================================
[module/date]
type = internal/date
interval = 1
date = %I:%M %p
label = %{F#ebcb8b}%{F-} %date%

;==========================================================
; OTROS MÓDULOS (Con iconos coloreados forzados)
;==========================================================
[module/filesystem]
type = internal/fs
mount-0 = /
label-mounted = %{F#88c0d0}%{F-} %percentage_used%%

[module/pulseaudio]
type = internal/pulseaudio
label-volume = %{F#81a1c1}%{F-} %percentage%%
label-muted =  mute
label-muted-foreground = ${colors.disabled}

[module/memory]
type = internal/memory
label = %{F#b48ead}%{F-} %percentage_used%%

[module/cpu]
type = internal/cpu
label = %{F#ebcb8b}%{F-} %percentage%%

[module/bspwm]
type = internal/bspwm
label-focused = %name%
label-focused-background = ${colors.background-alt}
label-focused-underline = ${colors.primary}
label-focused-padding = 1
label-occupied = %name%
label-occupied-padding = 1
label-empty = %name%
label-empty-foreground = ${colors.disabled}
label-empty-padding = 1

[module/xwindow]
type = internal/xwindow
label = %title:0:30:...%
label-foreground = ${colors.primary}

[module/systray]
type = internal/tray
tray-size = 66%

[settings]
screenchange-reload = true
pseudo-transparency = true
EOF

```

### 2. Actualizar el script de lanzamiento (`~/.config/polybar/launch.sh`)

El script anterior buscaba múltiples barras independientes. Debemos reescribirlo para que apunte de manera exclusiva a la nueva barra `[bar/parrot]`.

Ejecuta lo siguiente:

```bash
cat << 'EOF' > ~/.config/polybar/launch.sh
#!/usr/bin/env bash

# Matar instancias previas
killall -q polybar

# Esperar a que se cierren los procesos
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar la única barra definida en la nueva configuración
polybar parrot -c ~/.config/polybar/config.ini &

echo "Polybar (parrot) cargada exitosamente."
EOF

```

### 3. Lanzar el entorno y aplicar cambios

Con ambos archivos sincronizados, ejecuta tu lanzador para levantar la nueva Polybar:

```bash
~/.config/polybar/launch.sh

```

---

## 🛠️ Troubleshoot: Problemas con la Interfaz de Red (WLAN)

Durante auditorías o configuraciones de entornos físicos vs. virtuales, los nombres lógicos de las interfaces de red suelen variar.

> **Importante:** En esta configuración, el módulo WLAN apunta estrictamente a `interface = wlp0s20f3`. Si tu sistema nombra tu tarjeta como `wlan0`, Polybar reportará permanentemente el estado como *off* (desconectado).

Si esto sucede, corrige el parámetro siguiendo estos pasos:

1. **Identifica tu interfaz real:**

```bash
ip a | grep "wl"

```

*(Busca un identificador como `wlan0`, `wlp2s0`, o `wlx...` si usas una antena USB en modo monitor).*

2. **Edita el archivo de configuración:**
Abre el archivo con tu editor preferido:

```bash
nano ~/.config/polybar/config.ini

```

Busca la directiva `[module/wlan]`.

3. **Actualiza y recarga:**
Cambia el valor de `interface` por el nombre que obtuviste en el paso 1, guarda el archivo y vuelve a ejecutar tu script `launch.sh`.

---

## 👤 Autor & Licencia

**Rodrigo Villegas** — Ethical Hacker | Pentester | Red Team Specialist

* **Enfoque:** Seguridad ofensiva, auditorías de red (wireless security), bug bounty y automatización.
* **GitHub:** [rodrigo47363](https://github.com/rodrigo47363)

[Licencia MIT](https://opensource.org/licenses/MIT)
*Libre para uso personal, profesional y modificación.*

> ⚡ *"Customize everything. Automate what you can. Hack ethically."*
