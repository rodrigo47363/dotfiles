
# ⚙️ Dotfiles — Cross-Platform Dev Environment

![Dotfiles Preview](Example1.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OS](https://img.shields.io/badge/OS-Linux%20%7C%20Windows-blue)](https://www.linux.org/)
[![Status](https://img.shields.io/badge/Status-Active-success)]()

---

## 🧩 Description

Personal dotfiles repository to **customize, automate, and optimize** development and pentesting environments across **Linux (Parrot/Kali)** and **Windows**.
Includes configurations and helper scripts for **Zsh, PowerShell, Polybar, Rofi, BSPWM**, and common productivity/pentest utilities.

This repo prioritizes recent configs and provides a modular `bootstrap.sh` for safe installation.

---

## 📌 Quick Start

```bash
# Clone repository
git clone [https://github.com/rodrigo47363/dotfiles.git](https://github.com/rodrigo47363/dotfiles.git) ~/dotfiles
cd ~/dotfiles

# Minimal bootstrap (creates symlinks, prioritizes latest versions)
chmod +x bootstrap.sh
./bootstrap.sh --minimal

```

---

## 📁 Repository Structure

```text
.
├── .zshrc                        # Main Zsh configuration (latest)
├── .zshrc_autocd                 # Auto-cd helper module
├── sxhkdrc                       # sxhkd / BSPWM keybindings
├── powermenu_alt.rasi            # Rofi theme for power menu
├── launch.sh                     # Startup script (Polybar, Rofi)
├── ethernet_status.sh            # Ethernet status helper (Polybar)
├── 12Hourscurrent.ini            # Polybar layout (12-hour clock)
├── "FIx battery and volume..."   # Polybar fix for battery & volume
├── current.ini / current2.ini    # Older Polybar variants
├── Microsoft.PowerShell...       # PowerShell profile for Windows
├── bootstrap.sh                  # Installer / Symlinker script
├── polybar/                      # Polybar specific themes
└── rofi/                         # Rofi specific themes

```

> **Note:** When multiple files share a base name (e.g., `current*.ini`), prefer the **most recently updated** file.

---

## 🔧 Hardware Fixes (Touchpad)

If you are using a laptop (e.g., Acer Nitro) and the touchpad click doesn't work, run this fix or add it to your startup script:

```bash
# Fix 'Tap-to-click' on synaptics/libinput touchpads (adjust ID '15' if needed)
xinput set-prop 15 "libinput Tapping Enabled" 1

```

---

## 🧰 Dependencies (Debian/Parrot/Kali)

```bash
sudo apt update && sudo apt install -y \
  git curl wget zsh unzip php build-essential ruby rofi kitty \
  aircrack-ng airgeddon cmake pkg-config python3-sphinx \
  libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-ewmh-dev \
  libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto \
  libxcb-image0-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev \
  libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev \
  libmpdclient-dev libuv1-dev libnl-genl-3-dev meson picom \
  feh scrot scrub xclip bat locate ranger  wmname acpi bspwm sxhkd \
  imagemagick cmatrix zsh-syntax-highlighting zsh-autosuggestions \
  texlive-latex-recommended hcxdumptool hcxtools neovim tmux brightnessctl fastfetch

```

*Note: Some modern tools like `lsd` or `fastfetch` might need to be installed via GitHub releases or Snap.*

---

## 👤 Author

**Rodrigo Vil** — Ethical Hacker & Pentester | Red Team & Bug Bounty Researcher

* **Focus:** Offensive security, automation, custom Linux environments.
* **GitHub:** [rodrigo47363](https://github.com/rodrigo47363)

---

# ⚙️ Dotfiles — Entorno Multiplataforma (Español)

### 💻 Configuración avanzada para Linux y Windows

---

## 🧩 Descripción

Repositorio de dotfiles personales para **optimizar, automatizar y estandarizar** entornos de desarrollo y pentesting.
Incluye configuraciones para **Zsh, PowerShell, Polybar, Rofi, BSPWM**, y utilidades de auditoría.

---

## 📌 Inicio Rápido

```bash
# Clonar
git clone [https://github.com/rodrigo47363/dotfiles.git](https://github.com/rodrigo47363/dotfiles.git) ~/dotfiles
cd ~/dotfiles

# Instalación mínima
chmod +x bootstrap.sh
./bootstrap.sh --minimal

```

---

## 🔧 Solución de Hardware (Touchpad)

Si el "clic por toque" (tap-to-click) no funciona en tu laptop, utiliza el siguiente comando o agrégalo a tu `bspwmrc`:

```bash
# Habilita el clic en touchpad (ajusta el ID '15' según tu hardware 'xinput list')
xinput set-prop 15 "libinput Tapping Enabled" 1

```

---

## 🔒 Notas de Seguridad

* **Importante:** Revisa el archivo `dotfiles_backup.rar` antes de usarlo.
* **No** subas credenciales, claves privadas o secretos al repositorio.
* Se recomienda usar `.gitignore` para excluir archivos `.rar` o backups sensibles.

---

## 📜 Licencia

MIT License — libre para uso personal y profesional.

> ⚡ *"Customize everything. Automate what you can. Hack ethically."*
> — **Rodrigo Vil**

```

### Recomendación extra para tu repositorio:
El archivo `dotfiles_backup.rar` es un riesgo de seguridad (podrías subir sin querer claves SSH, historial de bash con contraseñas, etc.).

Te sugiero encarecidamente que:
1.  Lo elimines del repositorio remoto: `git rm dotfiles_backup.rar`.
2.  Lo añadas al `.gitignore`:
    ```bash
    echo "*.rar" >> .gitignore
    ```
3.  Si necesitas tener un backup privado, usa un repositorio privado separado o guárdalo en la nube (Google Drive/Mega), no en tu repo público de dotfiles.

```
