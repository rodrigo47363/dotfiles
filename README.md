# ⚙️ Dotfiles — Entorno de Auditoría Ofensiva, Pentesting y Desarrollo

![Dotfiles Preview](Example1.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS: Linux | Windows](https://img.shields.io/badge/OS-Parrot%20%7C%20Kali%20%7C%20Debian-blue)](https://parrotsec.org/)
[![WM: BSPWM](https://img.shields.io/badge/WM-BSPWM-black)](https://github.com/baskerville/bspwm)
[![Hotkeys: SXHKD](https://img.shields.io/badge/Hotkeys-SXHKD-orange)](https://github.com/baskerville/sxhkd)
[![Bar: Polybar](https://img.shields.io/badge/Bar-Polybar%20Pro-cyan)](https://polybar.github.io/)
[![Status: Active](https://img.shields.io/badge/Status-Active-success)](https://github.com/rodrigo47363/dotfiles)

---

## 🧩 Descripción y Arquitectura del Entorno

Este repositorio almacena y sincroniza la configuración integral de un entorno de trabajo de alto rendimiento optimizado para **Seguridad Ofensiva, Operaciones de Red Team, Bug Bounty y Desarrollo de Software**.

Construido sobre distribuciones basadas en Debian/Parrot OS, el sistema utiliza una arquitectura de **gestión de ventanas en mosaico (Tiling Window Manager)** minimalista y desacoplada:

* **Gestor de Ventanas:** [BSPWM](https://github.com/baskerville/bspwm) (árbol binario de división del espacio).
* **Gestor de Atajos:** [SXHKD](https://github.com/baskerville/sxhkd) (arquitectura pura basada en tecla `Super` sin colisiones).
* **Barra de Estado:** [Polybar](https://github.com/polybar/polybar) modular con telemetría en tiempo real y scripts tácticos para pentesting.
* **Lanzador / Menú:** [Rofi](https://github.com/davatorium/rofi) con modo single-instance y soporte de temas dinámicos.
* **Emulador de Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) acelerado por GPU con fuente *Hack Nerd Font*, ligaduras y multiplexación nativa.
* **Shell:** [Zsh](https://www.zsh.org/) con tema [Powerlevel10k](https://github.com/romkatv/powerlevel10k), autocompletado predictivo y sintaxis enriquecida.
* **Hardware & Telemetría:** Integración nativa en Rust con **AcerSense / NitroSense** para control térmico y perfilado de ventiladores.

---

## 🛡️ OPSEC y Seguridad del Repositorio

Como estándar de seguridad operativa (OPSEC):
1. **Política Zero-Trust:** Ninguna clave privada SSH (`id_rsa`, `id_ed25519`), token de API (`ghp_`, `AWS_*`), cookie de sesión o historial de shell (`.zsh_history`, `.bash_history`) debe ser rastreado en Git.
2. **Exclusión de volcados:** El archivo `.gitignore` debe excluir volcados comprimidos (`.rar`, `.zip`, `.tar.gz`) que contengan copias de respaldo locales.
3. **Manejo de credenciales de red:** Toda configuración de red o VPN rastreada utiliza interfaces genéricas y variables dinámicas para evitar filtrar subredes internas.

---

## 🚀 Despliegue Rápido (Instalación & Sincronización)

### 1. Clonar el Repositorio
```bash
git clone https://github.com/rodrigo47363/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Desplegar Enlaces Simbólicos / Copiar a `~/.config`
```bash
# Crear estructura base
mkdir -p ~/.config/{bspwm/scripts,sxhkd,polybar/scripts,rofi/themes,kitty}

# Desplegar configuraciones
cp -r polybar/* ~/.config/polybar/
cp -r rofi/* ~/.config/rofi/
cp sxhkdrc ~/.config/sxhkd/sxhkdrc
cp bspwmrc ~/.config/bspwm/bspwmrc
cp bspwm_resize ~/.config/bspwm/scripts/bspwm_resize
cp kitty.conf ~/.config/kitty/kitty.conf
cp .zshrc ~/.zshrc

# Asignar permisos de ejecución a los binarios y scripts
chmod +x ~/.config/bspwm/bspwmrc ~/.config/bspwm/scripts/*
chmod +x ~/.config/polybar/launch.sh ~/.config/polybar/scripts/*
```

---

## 🧰 Dependencias Base del Sistema (Debian / Parrot / Kali)

```bash
sudo apt update -y && sudo apt install -y \
    bspwm sxhkd polybar rofi picom feh kitty zsh tmux neovim \
    xinput brightnessctl pamixer xclip libnotify-bin curl wget jq bat \
    build-essential cmake pkg-config openvpn network-manager \
    zsh-syntax-highlighting zsh-autosuggestions \
    fonts-noto fonts-font-awesome \
    && sudo updatedb
```

---

## ⌨️ Mapa Táctico de Atajos de Teclado (`sxhkdrc`)

El archivo [`sxhkdrc`](sxhkdrc) centraliza los accesos rápidos. Toda la arquitectura fue migrada a **Pure Super Bindings** (`Mod4` / Tecla Windows), eliminando por completo las colisiones con la tecla `Alt` requeridas en navegadores, Burp Suite y editores.

### 🖥️ Gestión de Ventanas y Sistema (BSPWM)
| Atajo | Acción Operativa |
|---|---|
| <kbd>Super</kbd> + <kbd>Return</kbd> | Abrir terminal Kitty principal (`/opt/kitty/bin/kitty`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Return</kbd> | Abrir terminal Kitty en ventana flotante |
| <kbd>Super</kbd> + <kbd>W</kbd> | Cerrar ventana enfocada (`bspc node -c`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>W</kbd> | Forzar terminación inmediata del proceso (`bspc node -k`) |
| <kbd>Super</kbd> + <kbd>T</kbd> | Cambiar ventana a modo Mosaico (*tiled*) |
| <kbd>Super</kbd> + <kbd>S</kbd> | Cambiar ventana a modo Flotante (*floating*) |
| <kbd>Super</kbd> + <kbd>F</kbd> | Alternar modo Pantalla Completa (*fullscreen*) |
| <kbd>Super</kbd> + <kbd>Esc</kbd> | Recargar configuración de `sxhkd` al vuelo (`pkill -USR1 -x sxhkd`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Esc</kbd> | Kill-switch de emergencia (`xkill`) para ventanas colgadas |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>R</kbd> | Reiniciar Polybar limpiamente (`launch.sh`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Q</kbd> | Cerrar sesión / Salir de BSPWM (`bspc quit`) |

### 🧭 Navegación y Control de Espacios de Trabajo
| Atajo | Acción Operativa |
|---|---|
| <kbd>Super</kbd> + <kbd>1</kbd> - <kbd>0</kbd> | Cambiar directamente al Espacio de Trabajo 1 al 10 |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> - <kbd>0</kbd> | **Mover ventana enfocada al Workspace y transferir el foco** (`--follow`) |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> - <kbd>0</kbd> | Mover ventana enfocada en segundo plano sin cambiar de escritorio |
| <kbd>Super</kbd> + <kbd>←</kbd> <kbd>↓</kbd> <kbd>↑</kbd> <kbd>→</kbd> | Cambiar foco de ventana (Oeste, Sur, Norte, Este) |
| <kbd>Super</kbd> + <kbd>H</kbd> <kbd>J</kbd> <kbd>K</kbd> <kbd>L</kbd> | Foco estilo Vim (Oeste, Sur, Norte, Este) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>H/J/K/L</kbd> | Intercambiar posición física de ventanas |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>H/J/K/L</kbd> | Redimensionar ventana activa en bloques de 20px |

### 🚀 Lanzadores y Herramientas (Rofi & Apps)
| Atajo | Acción Operativa |
|---|---|
| <kbd>Super</kbd> + <kbd>D</kbd> o <kbd>Espacio</kbd> | Alternar Menú de Aplicaciones Rofi (`drun` con toggle de instancia única) |
| <kbd>Super</kbd> + <kbd>R</kbd> | Modo ejecución de comandos Rofi (`run`) |
| <kbd>Super</kbd> + <kbd>Tab</kbd> | Selector de ventanas abiertas Rofi (`window`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>Espacio</kbd> | Lanzador combinado Rofi (`combi`) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>F</kbd> | Lanzar navegador web (Firefox) |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd> | Lanzar Burp Suite Professional / Community |
| <kbd>Super</kbd> + <kbd>V</kbd> | Lanzar Stremio con wrapper de inicialización |
| <kbd>Alt</kbd> + <kbd>F4</kbd> | **Menú de apagado interactivo Rofi** (`powermenu`) |

### 🍅 Control Pomodoro (`pomoc`)
| Atajo | Acción Operativa |
|---|---|
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>P</kbd> | Iniciar / Alternar Pausa-Reanudar sesión de enfoque (`toggle`) |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>E</kbd> | Terminar bloque de concentración actual y saltar a descanso (`end`) |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>R</kbd> | **Reiniciar temporizador a tiempo inicial en IDLE** (`reset`) |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>S</kbd> | Detener por completo el demonio Pomodoro (`stop`) |
| <kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>P</kbd> | **Menú Rofi interactivo Pomodoro** (minutos personalizados, reset, etc.) |

### 🌀 Telemetría AcerSense / NitroSense
| Atajo | Acción Operativa |
|---|---|
| <kbd>XF86Launch1</kbd> / <kbd>Tecla Nitro [N]</kbd> | Abrir GUI de AcerSense / NitroSense |
| <kbd>Super</kbd> + <kbd>N</kbd> | Atajo alternativo por software para abrir la GUI |
| <kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>N</kbd> | Alternar ventiladores entre **Turbo Máximo** y **Automático** (notificación en pantalla) |

---

## 📊 Polybar — Suite Modular Táctica (`config.ini`)

La barra de estado está estructurada en tres secciones ergonómicas:

```ini
modules-left   = launcher bspwm xwindow
modules-center = target vpn pomodoro
modules-right  = filesystem cpu temperature gpu acersense memory backlight pulseaudio wlan eth battery date powermenu systray
```

### 🎯 Módulos Centrales Ofensivos

#### 1. Módulo VPN Multientorno ([`vpn.sh`](polybar/scripts/vpn.sh))
Diseñado específicamente para flujos de trabajo de seguridad ofensiva:
* **Icono Estándar de VPN (`󰖀` / `U+F0580`):** Aplica para VPNs comerciales, genéricas o túneles privados (WireGuard, OpenVPN).
* **Detección Nativa de Proton VPN:**
  * Reconoce interfaces `proton*` (ej. `proton0`), daemons (`proton-vpn-daemon`) y clientes GTK/CLI.
  * Etiqueta: `PROTON`, Icono: `󰖀`, Color: `#6d4aff` (púrpura corporativo).
* **Identificación Automática de Plataformas:**
  * **Hack The Box (HTB):** `󰆧 HTB: <IP>` en verde (`#98c379`).
  * **TryHackMe (THM):** `󰅣 THM: <IP>` en rojo (`#e06c75`).
  * **OffSec / Proving Grounds:** ` OFFSEC: <IP>` en naranja (`#d19a66`).
  * **WireGuard General:** `󰒄 WG: <IP>` en azul (`#61afef`).
  * **Tailscale:** `󰛳 TS: <IP>` en cyan (`#56b6c2`).
* **Priorización Táctica de Interfaces (Dual-Homed):** Si estás conectado a Proton VPN para privacidad y levantas una VPN de laboratorio (`tun0` hacia HTB o THM), el script prioriza inmediatamente la IP del laboratorio para que dispongas de tu `LHOST` al instante. Al desconectar el laboratorio, vuelve de forma transparente a Proton VPN.
* **Acciones Interactivas:**
  * **Click Izquierdo:** Copia instantánea de la dirección IP (`LHOST`) al portapapeles y notificación con `notify-send`.

#### 2. Rastreador de Máquina Objetivo ([`target.sh`](polybar/scripts/target.sh))
* Monitorea el archivo `~/.config/bin/target` conteniendo `IP [Nombre_Maquina]`.
* Comprueba la conectividad de la máquina con un ping ICMP rápido (timeout 1s):
  * Si responde: Icono verde `󰓾` con texto claro.
  * Si no responde: Icono rojo `󰓾` con texto tenue.
* Trunca nombres largos a 10 caracteres con elipsis (`..`) para proteger el espacio de la barra.
* **Click Izquierdo:** Copia la IP objetivo al portapapeles.
* **Click Derecho:** Limpia el archivo de objetivo (`No target`).

#### 3. Temporizador Pomodoro ([`pomodoro.sh`](polybar/scripts/pomodoro.sh))
* Conexión directa mediante sockets UNIX con el binario [`pomoc`](https://github.com/dream-wa1ker/pomoc).
* Muestra tiempo restante y estado: Trabajo (``), Pausa (`⏸`), Descanso (``).
* **Tap 1 dedo (Click Izquierdo):** Iniciar / Pausar / Reanudar (`toggle`).
* **Doble Tap 1 dedo:** **Reiniciar temporizador a tiempo inicial en IDLE (`reset`)**.
* **Tap 2 dedos (Click Derecho):** Concluir bloque y pasar a descanso (`end`).
* **Deslizar 2 dedos Arriba (Scroll Up):** **Reiniciar temporizador a IDLE (`reset`)**.
* **Deslizar 2 dedos Abajo (Scroll Down):** **Abrir Menú Rofi Pomodoro (`menu`)** (tiempos personalizados, reset, daemon kill/restart).
* **Click Central (Rueda de ratón físico):** Reiniciar temporizador (`reset`).

---

### 💻 Módulos de Hardware y Rendimiento

* **GPU NVIDIA con D3cold Sleep Guard ([`gpu.sh`](polybar/scripts/gpu.sh)):**
  * Lee `/sys/bus/pci/devices/*/power/runtime_status`.
  * Si la GPU dedicada NVIDIA está suspendida en bajo consumo (`suspended`), muestra `󰢮 GPU Off` en gris `#5c6370` y **evita ejecutar `nvidia-smi`**, impidiendo que la GPU se despierte y ahorrando batería crítica en portátiles híbridos.
* **AcerSense / NitroSense Telemetry ([`acersense.sh`](polybar/scripts/acersense.sh)):**
  * Backend nativo compilado en Rust con tiempo de respuesta inferior a 2ms.
  * Informa estado de RPM de ventiladores y temperatura de CPU/GPU.
  * **Click Izquierdo:** Alterna entre modo silencioso/automático y modo **MAX TURBO**.
  * **Click Derecho:** Abre la interfaz gráfica de AcerSense.
* **Gestor WiFi Interactivo ([`wifi-menu.sh`](polybar/scripts/wifi-menu.sh)):**
  * Menú Rofi para escanear redes inalámbricas, consultar fuerza de señal e ingresar contraseñas protegidas.

---

## 🪟 Configuración de BSPWM (`bspwmrc`)

Aspectos destacados implementados en [`bspwmrc`](bspwmrc):
* **Fijación de Identidad Java:** `wmname LG3D &` para resolver incompatibilidades de renderizado y menús grises en aplicaciones Java como **Burp Suite Professional**.
* **Gestión de Teclado y Teclas Huérfanas:** Remapeo de eventos X11 y desactivación de estados de bloqueo residuales (`xmodmap`, `numlockx`).
* **Hardware Touchpad:** Detección automática en bucle para habilitar *Tap-to-click* y *Natural Scrolling* mediante `libinput` en cualquier ID de dispositivo señalador.
* **Arranque Limpio:** Verificación de instancias previas antes de lanzar `sxhkd`, `picom`, `polybar` y gestores de fondo de pantalla (`feh`).

---

## 🖥️ Terminal Kitty (`kitty.conf`)

* **Tipografía:** *Hack Nerd Font* con tamaño de 12pt y soporte completo de ligaduras.
* **Renderizado & Transparencia:** Fondo con opacidad al 85% (`background_opacity 0.85`), sincronización vertical activa (`sync_to_monitor yes`) y latencia ultrabaja.
* **Navegación:** Atajos mapeados con <kbd>Ctrl</kbd> + <kbd>Flechas</kbd> para navegar entre divisiones internas de la terminal.
* **Buffers Múltiples:** Copia y pega en buffers dedicados `a` y `b` con teclas <kbd>F1</kbd> a <kbd>F4</kbd>.

---

## 📁 Estructura del Repositorio

```text
dotfiles/
├── bspwmrc                              # Script maestro de inicialización de BSPWM y reglas de ventanas
├── sxhkdrc                              # Mapeo de atajos de teclado globales (Pure Super Mod4)
├── bspwm_resize                         # Utilidad auxiliar para redimensionar ventanas en tiling
├── KEYBOARD_AND_SHORTCUTS_TROUBLESHOOTING.md # Diagnóstico y resolución de incidencias en teclado y X11
├── kitty.conf                           # Configuración del emulador de terminal Kitty
├── polybar/                             # Suite completa de Polybar
│   ├── config.ini                       # Configuración principal de barras, módulos y paleta OneDark
│   ├── launch.sh                        # Script de inicialización segura con logging a /tmp/polybar.log
│   ├── fonts/                           # Fuentes TTF/OTF (Hack Nerd Font, Iosevka, feather)
│   └── scripts/                         # Scripts operativos de Polybar
│       ├── acersense.sh                 # Telemetría e interactividad de ventiladores (Rust backend)
│       ├── gpu.sh                       # Monitoreo de GPU con detección de reposo D3cold
│       ├── launcher                     # Lanzador Rofi con toggle single-instance
│       ├── pomodoro.sh                  # Controlador Pomodoro vía sockets UNIX (pomoc)
│       ├── target.sh                    # Rastreador de IP objetivo para pentesting con ICMP check
│       ├── vpn.sh                       # Detección inteligente de VPN (Proton, HTB, THM, WireGuard)
│       └── wifi-menu.sh                 # Menú interactivo de selección WiFi vía Rofi
├── rofi/                                # Configuración de Rofi
│   ├── config.rasi                      # Configuración de modos, atajos e interfaz
│   └── themes/                          # Paletas y estilos visuales
├── .zshrc                               # Configuración de Zsh con plugins, PATH y alias ofensivos
└── README.md                            # Documentación técnica completa del entorno
```

---

## 👤 Autor & Licencia

**Rodrigo Villegas** — Ethical Hacker | Pentester | Red Team Specialist

* **Especialidad:** Seguridad Ofensiva, Auditorías de Redes, Infraestructura de Laboratorios y Automatización.
* **GitHub:** [@rodrigo47363](https://github.com/rodrigo47363)

Distribuido bajo la [Licencia MIT](https://opensource.org/licenses/MIT).

> ⚡ *"Customize everything. Automate what you can. Hack ethically."*
