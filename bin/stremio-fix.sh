#!/usr/bin/env bash
# ==============================================================================
# 🎬 STREMIO FLATPAK LAUNCHER & GPU RENDERER MANAGER
# ==============================================================================
# Autor: Rodrigo Villegas (@rodrigo47363)
# Repositorio: https://github.com/rodrigo47363/dotfiles
# Entorno: BSPWM / X11 / Parrot OS (Debian) / Hybrid GPU (Intel UHD + NVIDIA RTX 3050)
#
# 📋 DESCRIPCIÓN TÉCNICA:
# Script wrapper optimizado para el lanzamiento de Stremio (Flatpak: com.stremio.Stremio).
# Diseñado para resolver bloqueos de servidor local y prevenir fallos de redibujado
# en la pila gráfica de WebKitGTK 6.0 + GTK4 bajo gestores de ventanas en mosaico (BSPWM).
#
# 🔍 DIAGNÓSTICO Y ANÁLISIS DE FALLO GRÁFICO (POST-MORTEM):
# Anteriormente se empleaban variables de entorno heredadas de workarounds obsoletos:
#   - WEBKIT_DISABLE_COMPOSITING_MODE=1
#   - WEBKIT_DISABLE_DMABUF_RENDERER=1
#
# En versiones modernas de WebKitGTK 6.0 (GNOME 50 Runtime / Mesa 25.08), desactivar
# el modo de composición acelerada fuerza un fallback por software sin compositor.
# Bajo X11, este modo desactiva los repaints globales de la superficie GTK4, provocando
# que la ventana se dibuje 100% negra y solo se actualicen los rectángulos dañados
# (dirty rects) que reciben eventos interactivos directos (la posición exacta del mouse).
#
# 🛠️ SOLUCIÓN APLICADA:
# 1. Eliminación de flags destructivos de composición (deja operar al pipeline nativo EGL/GLX).
# 2. Reseteo de demonio de streaming local (Node.js en puerto 11470) para evitar deadlocks.
# 3. Sustitución de proceso mediante 'exec' para propagación correcta de señales UNIX.
# 4. Paso de argumentos ("$@") para soportar enlaces magnet, torrents y URIs externos.
# ==============================================================================

set -eo pipefail

# 1. Terminación segura de instancias huérfanas previas
# Previene colisiones de sockets en /run/user/$UID/stremio y el servidor local en puerto 11470
flatpak kill com.stremio.Stremio 2>/dev/null || true

# 2. Ejecución directa con el pipeline nativo de aceleración por hardware
# El runtime de Flatpak gestiona automáticamente la interoperabilidad con DRI, X11 y GPU.
exec /usr/bin/flatpak run \
    --command=stremio \
    com.stremio.Stremio "$@"
