#!/usr/bin/env python3
"""
Windows 11 Interface Assets Extractor
Author: Pentest & Software Architecture Suite (for Rodrigo47363)
Purpose: Extract wallpapers, fonts, cursors, sounds, and native Fluent icons from Windows 11 install.wim.
"""

import os
import sys
import glob
import shutil
import subprocess

ISO_MOUNT = "/media/rodrigo47363/CCCOMA_X64FRE_EN-US_DV9"
WIM_PATH = os.path.join(ISO_MOUNT, "sources/install.wim")
OUTPUT_BASE = "/home/rodrigo47363/Downloads/Windows11_Assets"

WALLPAPERS_DIR = os.path.join(OUTPUT_BASE, "Wallpapers")
FONTS_DIR = os.path.join(OUTPUT_BASE, "Fonts")
CURSORS_DIR = os.path.join(OUTPUT_BASE, "Cursors")
SOUNDS_DIR = os.path.join(OUTPUT_BASE, "Sounds")
ICONS_DIR = os.path.join(OUTPUT_BASE, "Icons_PNG")
RESOURCES_DIR = os.path.join(OUTPUT_BASE, "Raw_SystemResources")

def run_cmd(cmd, desc):
    print(f"[*] {desc}...")
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if res.returncode != 0:
        print(f"[!] Warning during: {desc}\n{res.stderr.strip()}")
    return res

def main():
    if not os.path.exists(WIM_PATH):
        print(f"[-] Error: {WIM_PATH} not found. Ensure ISO is mounted at {ISO_MOUNT}.")
        sys.exit(1)

    print(f"[+] Starting Windows 11 25H2 Interface Assets Extraction...")
    print(f"[+] Output Directory: {OUTPUT_BASE}")

    for d in [WALLPAPERS_DIR, FONTS_DIR, CURSORS_DIR, SOUNDS_DIR, ICONS_DIR, RESOURCES_DIR]:
        os.makedirs(d, exist_ok=True)

    temp_extract = "/tmp/win11_extract_tmp"
    shutil.rmtree(temp_extract, ignore_errors=True)
    os.makedirs(temp_extract, exist_ok=True)

    # 1. Extraer Wallpapers (Bloom, Glow, Motion, Flow, Sunrise, 4K)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/web",
        "1/Windows/Web/Wallpaper/*", "1/Windows/Web/Screen/*", "1/Windows/Web/4K/*", "-y"
    ], "Extrayendo Fondos de Pantalla Oficiales de Windows 11")

    web_path = f"{temp_extract}/web/1/Windows/Web"
    if os.path.exists(web_path):
        for item in os.listdir(web_path):
            s = os.path.join(web_path, item)
            d = os.path.join(WALLPAPERS_DIR, item)
            if os.path.exists(d):
                shutil.rmtree(d, ignore_errors=True)
            shutil.move(s, d)

    # 2. Extraer Fuentes Oficiales (Segoe UI Variable, Segoe UI, Segoe Fluent Icons, Cascadia)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/fonts",
        "1/Windows/Fonts/*segoe*", "1/Windows/Fonts/*Segoe*", "1/Windows/Fonts/*SegUI*",
        "1/Windows/Fonts/*Cascadia*", "1/Windows/Fonts/*consola*", "-y"
    ], "Extrayendo Tipografías Oficiales de Windows 11")

    fonts_extracted = glob.glob(f"{temp_extract}/fonts/1/Windows/Fonts/*.*")
    for f in fonts_extracted:
        shutil.copy(f, FONTS_DIR)

    # 3. Extraer Cursores Nativos de Windows 11
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/cursors",
        "1/Windows/Cursors/*", "-y"
    ], "Extrayendo Cursores (.cur y .ani) de Windows 11")

    cursors_extracted = glob.glob(f"{temp_extract}/cursors/1/Windows/Cursors/*.*")
    for c in cursors_extracted:
        shutil.copy(c, CURSORS_DIR)

    # 4. Extraer Sonidos del Sistema de Windows 11
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/sounds",
        "1/Windows/Media/*.wav", "-y"
    ], "Extrayendo Sonidos (.wav) de Windows 11")

    sounds_extracted = glob.glob(f"{temp_extract}/sounds/1/Windows/Media/*.wav")
    for s in sounds_extracted:
        shutil.copy(s, SOUNDS_DIR)

    # 5. Extraer .mun de Recursos del Sistema (imageres, shell32, ddores)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/resources",
        "1/Windows/SystemResources/imageres.dll.mun",
        "1/Windows/SystemResources/shell32.dll.mun",
        "1/Windows/SystemResources/DDORes.dll.mun",
        "-y"
    ], "Extrayendo DLLs/MUN de Recursos de Iconos")

    mun_files = glob.glob(f"{temp_extract}/resources/1/Windows/SystemResources/*.mun")
    for m in mun_files:
        shutil.copy(m, RESOURCES_DIR)

    # 6. Desempaquetar y Reconstruir Iconos PNG de Alta Definición (256x256)
    print("[*] Procesando y extrayendo Iconos PNG Fluent de alta resolución (256x256)...")
    total_icons = 0
    for m in mun_files:
        base_name = os.path.basename(m).replace(".dll.mun", "")
        mun_unpack_dir = f"{temp_extract}/unpack_{base_name}"
        os.makedirs(mun_unpack_dir, exist_ok=True)
        run_cmd([
            "7z", "x", m, f"-o{mun_unpack_dir}", ".rsrc/ICON/*", ".rsrc/PNG/*", "-y"
        ], f"Desempaquetando recursos de {base_name}")

        # Extraer PNGs nativos de 256x256 contenidos en .rsrc/ICON/
        icon_frames = glob.glob(f"{mun_unpack_dir}/.rsrc/ICON/*")
        count_for_module = 0
        for icon_file in icon_frames:
            try:
                with open(icon_file, "rb") as fp:
                    header = fp.read(8)
                if header.startswith(b"\x89PNG\r\n\x1a\n"):
                    frame_id = os.path.basename(icon_file)
                    dest_png = os.path.join(ICONS_DIR, f"{base_name}_{frame_id}_256px.png")
                    shutil.copy(icon_file, dest_png)
                    count_for_module += 1
                    total_icons += 1
            except Exception:
                pass

        # Copiar también los PNG de interfaz en .rsrc/PNG/
        png_assets = glob.glob(f"{mun_unpack_dir}/.rsrc/PNG/*")
        for p in png_assets:
            pid = os.path.basename(p)
            dest_png = os.path.join(ICONS_DIR, f"{base_name}_asset_{pid}.png")
            shutil.copy(p, dest_png)
            count_for_module += 1
            total_icons += 1

        print(f"[+] {base_name}: {count_for_module} iconos y gráficos Fluent extraídos.")

    # 7. Instalar fuentes Segoe en el entorno local del usuario
    local_fonts = os.path.expanduser("~/.local/share/fonts/Windows11")
    os.makedirs(local_fonts, exist_ok=True)
    print(f"[*] Instalando fuentes Segoe y Cascadia en {local_fonts}...")
    for f in glob.glob(f"{FONTS_DIR}/*.*"):
        shutil.copy(f, local_fonts)
    run_cmd(["fc-cache", "-f", local_fonts], "Actualizando caché de tipografías del sistema (fc-cache)")

    # Limpieza temporal
    shutil.rmtree(temp_extract, ignore_errors=True)

    print("\n" + "="*60)
    print("[✔] EXTRACCIÓN COMPLETADA CON ÉXITO")
    print(f"[*] Total Iconos y Activos Gráficos: {total_icons}")
    print(f"[*] Wallpapers:  {len(glob.glob(f'{WALLPAPERS_DIR}/**/*.jpg', recursive=True))} fondos")
    print(f"[*] Fuentes:     {len(glob.glob(f'{FONTS_DIR}/*.*'))} archivos TTF/OTF")
    print(f"[*] Cursores:    {len(glob.glob(f'{CURSORS_DIR}/*.*'))} archivos")
    print(f"[*] Sonidos:     {len(glob.glob(f'{SOUNDS_DIR}/*.*'))} archivos WAV")
    print(f"[*] Directorio:  {OUTPUT_BASE}")
    print("="*60)

if __name__ == "__main__":
    main()
