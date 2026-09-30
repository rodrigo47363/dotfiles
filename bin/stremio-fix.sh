#!/bin/bash
# ==============================================================================
# 🎬 Stremio Launcher & Process Manager
# ==============================================================================
# Cerrar instancias previas para evitar conflictos de puerto/servidor local
flatpak kill com.stremio.Stremio 2>/dev/null || true

# Ejecución limpia con el pipeline nativo de aceleración por hardware de Flatpak.
# (Se eliminaron flags obsoletos como WEBKIT_DISABLE_COMPOSITING_MODE y
# WEBKIT_DISABLE_DMABUF_RENDERER que rompían el renderizado en WebKitGTK 6.0)
exec /usr/bin/flatpak run com.stremio.Stremio "$@"
