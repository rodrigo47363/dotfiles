#!/usr/bin/env python3
"""
Windows 10 Interface Assets Extractor & Reverse Engineering Analysis
Author: Pentest & Software Architecture Suite (for Rodrigo47363)
Purpose: Extract wallpapers, fonts, cursors, sounds, themes, and native Metro icons from Windows 10 install.wim.
"""

import os
import sys
import glob
import shutil
import subprocess

ISO_MOUNT = "/media/rodrigo47363/CCCOMA_X64FRE_EN-GB_DV9"
WIM_PATH = os.path.join(ISO_MOUNT, "sources/install.wim")
OUTPUT_BASE = "/home/rodrigo47363/Downloads/Windows10_Assets"

WALLPAPERS_DIR = os.path.join(OUTPUT_BASE, "Wallpapers")
FONTS_DIR = os.path.join(OUTPUT_BASE, "Fonts")
CURSORS_DIR = os.path.join(OUTPUT_BASE, "Cursors")
SOUNDS_DIR = os.path.join(OUTPUT_BASE, "Sounds")
THEMES_DIR = os.path.join(OUTPUT_BASE, "Themes")
ICONS_DIR = os.path.join(OUTPUT_BASE, "Icons_PNG")
RESOURCES_DIR = os.path.join(OUTPUT_BASE, "Raw_SystemResources")

def run_cmd(cmd, desc):
    print(f"[*] {desc}...")
    res = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if res.returncode != 0:
        print(f"[!] Warning during: {desc}\n{res.stderr.strip()[:300]}")
    return res

def main():
    if not os.path.exists(WIM_PATH):
        print(f"[-] Error: {WIM_PATH} not found. Ensure ISO is mounted at {ISO_MOUNT}.")
        sys.exit(1)

    print(f"[+] Starting Windows 10 22H2 Interface Assets Extraction & Decompilation...")
    print(f"[+] Output Directory: {OUTPUT_BASE}")

    for d in [WALLPAPERS_DIR, FONTS_DIR, CURSORS_DIR, SOUNDS_DIR, THEMES_DIR, ICONS_DIR, RESOURCES_DIR]:
        os.makedirs(d, exist_ok=True)

    temp_extract = "/tmp/win10_extract_tmp"
    shutil.rmtree(temp_extract, ignore_errors=True)
    os.makedirs(temp_extract, exist_ok=True)

    # 1. Extraer Wallpapers Oficiales (Hero 4K, Default, Screen, Themes)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/web",
        "1/Windows/Web/Wallpaper/*", "1/Windows/Web/Screen/*", "1/Windows/Web/4K/*", "-y"
    ], "Extrayendo Fondos de Pantalla Oficiales de Windows 10")

    web_path = f"{temp_extract}/web/1/Windows/Web"
    if os.path.exists(web_path):
        for item in os.listdir(web_path):
            s = os.path.join(web_path, item)
            d = os.path.join(WALLPAPERS_DIR, item)
            if os.path.exists(d):
                shutil.rmtree(d, ignore_errors=True)
            shutil.move(s, d)

    # 2. Extraer Fuentes Oficiales (Segoe UI, Segoe UI Symbol, Segoe MDL2 Assets, HoloLens, Consolas)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/fonts",
        "1/Windows/Fonts/*segoe*", "1/Windows/Fonts/*Segoe*", "1/Windows/Fonts/*SegUI*",
        "1/Windows/Fonts/*segmdl2*", "1/Windows/Fonts/*holomdl2*",
        "1/Windows/Fonts/*consola*", "1/Windows/Fonts/*marlett*", "-y"
    ], "Extrayendo Tipografías Oficiales de Windows 10")

    fonts_extracted = glob.glob(f"{temp_extract}/fonts/1/Windows/Fonts/*.*")
    for f in fonts_extracted:
        shutil.copy(f, FONTS_DIR)

    # 3. Extraer Cursores Nativos de Windows 10
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/cursors",
        "1/Windows/Cursors/*", "-y"
    ], "Extrayendo Cursores (.cur y .ani) de Windows 10")

    cursors_extracted = glob.glob(f"{temp_extract}/cursors/1/Windows/Cursors/*.*")
    for c in cursors_extracted:
        shutil.copy(c, CURSORS_DIR)

    # 4. Extraer Esquemas de Sonido (.wav) de Windows 10
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/sounds",
        "1/Windows/Media/*.wav", "-y"
    ], "Extrayendo Sonidos (.wav) de Windows 10")

    sounds_extracted = glob.glob(f"{temp_extract}/sounds/1/Windows/Media/*.wav")
    for s in sounds_extracted:
        shutil.copy(s, SOUNDS_DIR)

    # 5. Extraer Recursos de Temas y Estilos Visuales (aero.theme, aero.msstyles)
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/themes",
        "1/Windows/Resources/Themes/*", "-y"
    ], "Extrayendo Temas y Estilos Visuales (aero.theme, msstyles)")

    themes_extracted = f"{temp_extract}/themes/1/Windows/Resources/Themes"
    if os.path.exists(themes_extracted):
        for item in os.listdir(themes_extracted):
            s = os.path.join(themes_extracted, item)
            d = os.path.join(THEMES_DIR, item)
            if os.path.exists(d):
                shutil.rmtree(d, ignore_errors=True) if os.path.isdir(d) else os.remove(d)
            shutil.move(s, d)

    # 6. Extraer .mun y DLLs de Recursos del Sistema
    run_cmd([
        "7z", "x", WIM_PATH, f"-o{temp_extract}/resources",
        "1/Windows/SystemResources/imageres.dll.mun",
        "1/Windows/SystemResources/DDORes.dll.mun",
        "1/Windows/SystemResources/accessibilitycpl.dll.mun",
        "1/Windows/WinSxS/Backup/*shell32.dll.mun*",
        "-y"
    ], "Extrayendo DLLs/MUN de Recursos de Iconos y UI")

    for root, dirs, files in os.walk(f"{temp_extract}/resources"):
        for file in files:
            if file.endswith(".mun") or "_shell32.dll.mun" in file:
                target_name = file
                if "_shell32.dll.mun" in file:
                    target_name = "shell32.dll.mun"
                shutil.copy(os.path.join(root, file), os.path.join(RESOURCES_DIR, target_name))

    # 7. Desempaquetar y Decompilar Iconos PNG de Alta Definición (256x256)
    print("[*] Desempaquetando y decompilando Iconos y Recursos Gráficos desde .mun...")
    total_icons = 0
    mun_files = glob.glob(f"{RESOURCES_DIR}/*.mun")
    for m in mun_files:
        base_name = os.path.basename(m).replace(".dll.mun", "").replace(".mun", "")
        mun_unpack_dir = f"{temp_extract}/unpack_{base_name}"
        os.makedirs(mun_unpack_dir, exist_ok=True)
        run_cmd([
            "7z", "x", m, f"-o{mun_unpack_dir}", ".rsrc/ICON/*", ".rsrc/PNG/*", ".rsrc/IMAGE/*", "-y"
        ], f"Desempaquetando recursos de {base_name}")

        # Extraer PNGs nativos de alta resolución contenidos en .rsrc/ICON/
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

        # Extraer PNGs de interfaz en .rsrc/PNG/ o .rsrc/IMAGE/
        png_assets = glob.glob(f"{mun_unpack_dir}/.rsrc/PNG/*") + glob.glob(f"{mun_unpack_dir}/.rsrc/IMAGE/*")
        for p in png_assets:
            pid = os.path.basename(p)
            dest_png = os.path.join(ICONS_DIR, f"{base_name}_asset_{pid}.png")
            shutil.copy(p, dest_png)
            count_for_module += 1
            total_icons += 1

        print(f"[+] {base_name}: {count_for_module} iconos y gráficos extraídos.")

    # 8. Extraer bitmaps del estilo visual aero.msstyles (Ingeniería Inversa del Tema Metro)
    msstyles_path = os.path.join(THEMES_DIR, "aero/aero.msstyles")
    if os.path.exists(msstyles_path):
        msstyles_unpack = f"{temp_extract}/unpack_msstyles"
        os.makedirs(msstyles_unpack, exist_ok=True)
        run_cmd([
            "7z", "x", msstyles_path, f"-o{msstyles_unpack}", ".rsrc/IMAGE/*", ".rsrc/PNG/*", "-y"
        ], "Decompilando aero.msstyles para extraer activos de taskbar, botones y ventanas")
        ms_images = glob.glob(f"{msstyles_unpack}/.rsrc/*/*")
        ms_count = 0
        for img in ms_images:
            try:
                with open(img, "rb") as fp:
                    header = fp.read(8)
                ext = ".png" if header.startswith(b"\x89PNG") else (".bmp" if header.startswith(b"BM") else ".bin")
                if ext in [".png", ".bmp"]:
                    dest = os.path.join(THEMES_DIR, f"aero_asset_{os.path.basename(img)}{ext}")
                    shutil.copy(img, dest)
                    ms_count += 1
            except Exception:
                pass
        print(f"[+] aero.msstyles: {ms_count} bitmaps y activos visuales de interfaz descompilados.")

    # 9. Instalar fuentes oficiales Segoe UI de Windows 10 en ~/.local/share/fonts/Windows10
    local_fonts = os.path.expanduser("~/.local/share/fonts/Windows10")
    os.makedirs(local_fonts, exist_ok=True)
    print(f"[*] Instalando fuentes Segoe UI de Windows 10 en {local_fonts}...")
    for f in glob.glob(f"{FONTS_DIR}/*.*"):
        shutil.copy(f, local_fonts)
    run_cmd(["fc-cache", "-f", local_fonts], "Actualizando caché de tipografías del sistema (fc-cache)")

    # Limpieza temporal
    shutil.rmtree(temp_extract, ignore_errors=True)

    print("\n" + "="*60)
    print("[✔] EXTRACCIÓN Y DECOMPILACIÓN COMPLETADA CON ÉXITO")
    print(f"[*] Total Iconos y Activos Gráficos: {total_icons}")
    print(f"[*] Wallpapers:  {len(glob.glob(f'{WALLPAPERS_DIR}/**/*.jpg', recursive=True))} fondos")
    print(f"[*] Fuentes:     {len(glob.glob(f'{FONTS_DIR}/*.*'))} archivos TTF/OTF")
    print(f"[*] Cursores:    {len(glob.glob(f'{CURSORS_DIR}/*.*'))} archivos")
    print(f"[*] Sonidos:     {len(glob.glob(f'{SOUNDS_DIR}/*.*'))} archivos WAV")
    print(f"[*] Directorio:  {OUTPUT_BASE}")
    print("="*60)

if __name__ == "__main__":
    main()
