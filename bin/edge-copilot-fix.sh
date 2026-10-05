#!/usr/bin/env bash
# ==============================================================================
# 🤖 Microsoft Edge Copilot & Sidebar Fix for Linux (Debian / Parrot / Ubuntu)
# Autor: Rodrigo Villegas (@rodrigo47363)
# ==============================================================================
# Causa: Las compilaciones de Edge para Linux no aprovisionan el archivo HubApps
# en el perfil del usuario, causando que el botón de Copilot / Chat y la barra
# lateral fallen silenciosamente al hacer clic.
# ==============================================================================

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_HUBAPPS="$DOTFILES_DIR/assets/edge/HubApps"
REMOTE_URL="https://raw.githubusercontent.com/RPDJF/dotfiles/refs/heads/master/.myconfig/ressources/HubApps"

TARGET_DIRS=(
    "$HOME/.config/microsoft-edge/Default"
    "$HOME/.var/app/com.microsoft.Edge/config/microsoft-edge/Default"
)

# Buscar perfiles adicionales (Profile 1, Profile 2, etc.)
for extra in "$HOME/.config/microsoft-edge/Profile "* "$HOME/.var/app/com.microsoft.Edge/config/microsoft-edge/Profile "*; do
    [ -d "$extra" ] && TARGET_DIRS+=("$extra")
done

echo -e "\e[36m[*] Comprobando aprovisionamiento de Copilot en Microsoft Edge...\e[0m"

for dir in "${TARGET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        target_file="$dir/HubApps"
        if [ ! -f "$target_file" ] || [ ! -s "$target_file" ]; then
            echo -e "\e[33m[!] HubApps no detectado en: $dir\e[0m"
            echo -e "\e[34m[*] Aprovisionando manifiesto HubApps...\e[0m"
            
            if [ -f "$LOCAL_HUBAPPS" ]; then
                cp "$LOCAL_HUBAPPS" "$target_file"
            else
                curl -fsSL "$REMOTE_URL" -o "$target_file"
            fi
            
            chmod 644 "$target_file"
            echo -e "\e[32m[+] HubApps aprovisionado exitosamente en $target_file\e[0m"
        else
            echo -e "\e[32m[✓] HubApps ya presente en $dir\e[0m"
        fi
    fi
done

if pgrep -x msedge >/dev/null; then
    echo -e "\e[33m[!] Microsoft Edge está en ejecución. Reinícialo ('killall msedge') para que el panel de Copilot surta efecto.\e[0m"
else
    echo -e "\e[32m[+] Configuración completada. Puedes iniciar Microsoft Edge.\e[0m"
fi
