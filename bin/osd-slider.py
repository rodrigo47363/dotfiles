#!/usr/bin/env python3
# ==============================================================================
# OSD SLIDER PRO - POPUP INTERACTIVO PARA VOLUMEN Y BRILLO
# BSPWM / Polybar / Parrot OS Suite
# ==============================================================================

import sys
import os
import signal
import subprocess
from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QLabel, QSlider, QPushButton
)
from PyQt5.QtCore import Qt, QEvent
from PyQt5.QtGui import QCursor, QFont, QKeyEvent

class ClickableSlider(QSlider):
    """QSlider mejorado que permite saltar directamente a la posición al hacer clic."""
    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            val = self.minimum() + ((self.maximum() - self.minimum()) * event.x()) / max(1, self.width())
            val = max(self.minimum(), min(self.maximum(), int(round(val))))
            self.setValue(val)
        super().mousePressEvent(event)

class OsdSliderWindow(QWidget):
    def __init__(self, mode="volume"):
        super().__init__()
        self.mode = mode
        self.setObjectName("MainWindow")

        # Configuración de ventana flotante sin bordes y siempre visible
        self.setWindowFlags(
            Qt.FramelessWindowHint |
            Qt.WindowStaysOnTopHint |
            Qt.Tool |
            Qt.X11BypassWindowManagerHint
        )
        self.setAttribute(Qt.WA_TranslucentBackground, True)
        self.setAttribute(Qt.WA_ShowWithoutActivating, False)

        # Paleta de colores One Dark & Cyberpunk
        if self.mode == "volume":
            self.accent_color = "#61afef"
            self.secondary_color = "#56b6c2"
            self.title_text = "Volumen"
            self.icon_default = "󰕾"
            self.presets = [20, 40, 60, 80, 100]
        else:
            self.accent_color = "#e5c07b"
            self.secondary_color = "#d19a66"
            self.title_text = "Brillo"
            self.icon_default = "󰃠"
            self.presets = [20, 40, 60, 80, 100]

        self.init_ui()
        self.sync_from_system()
        self.position_window()

    def get_system_state(self):
        if self.mode == "volume":
            try:
                muted_str = subprocess.check_output(
                    ["pamixer", "--get-mute"], stderr=subprocess.DEVNULL
                ).decode().strip()
                is_muted = (muted_str == "true")
                vol = int(subprocess.check_output(
                    ["pamixer", "--get-volume"], stderr=subprocess.DEVNULL
                ).decode().strip())
                return vol, is_muted
            except Exception:
                return 50, False
        else:
            try:
                b_str = subprocess.check_output(
                    "brightnessctl -m 2>/dev/null | cut -d, -f4 | tr -d '%'",
                    shell=True, stderr=subprocess.DEVNULL
                ).decode().strip()
                return int(b_str) if b_str else 50, False
            except Exception:
                return 50, False

    def apply_system_value(self, val):
        if self.mode == "volume":
            subprocess.run(["pamixer", "-u", "--set-volume", str(val)], check=False)
        else:
            val = max(1, val)
            subprocess.run(["brightnessctl", "set", f"{val}%", "-n", "1"], check=False)

    def toggle_system_mute(self):
        if self.mode == "volume":
            subprocess.run(["pamixer", "-t"], check=False)
            self.sync_from_system()

    def init_ui(self):
        self.setFixedSize(360, 140)

        # Contenedor principal con estilo y bordes redondeados
        container = QWidget(self)
        container.setObjectName("Container")
        container.setGeometry(0, 0, 360, 140)

        main_layout = QVBoxLayout(container)
        main_layout.setContentsMargins(18, 14, 18, 14)
        main_layout.setSpacing(10)

        # Fila Superior: Icono, Título y Porcentaje
        header_layout = QHBoxLayout()
        header_layout.setSpacing(8)

        self.icon_label = QLabel(self.icon_default)
        self.icon_label.setFont(QFont("Hack Nerd Font", 13))
        self.icon_label.setStyleSheet(f"color: {self.accent_color};")

        self.title_label = QLabel(self.title_text)
        self.title_label.setObjectName("Title")
        self.title_label.setFont(QFont("Noto Sans", 10, QFont.Bold))

        self.value_label = QLabel("0%")
        self.value_label.setObjectName("Value")
        self.value_label.setFont(QFont("Hack Nerd Font", 12, QFont.Bold))
        self.value_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)

        header_layout.addWidget(self.icon_label)
        header_layout.addWidget(self.title_label)
        header_layout.addStretch()
        header_layout.addWidget(self.value_label)
        main_layout.addLayout(header_layout)

        # Fila Central: Slider interactivo
        self.slider = ClickableSlider(Qt.Horizontal)
        self.slider.setRange(0 if self.mode == "volume" else 1, 100)
        self.slider.setCursor(Qt.PointingHandCursor)
        self.slider.valueChanged.connect(self.on_slider_changed)
        main_layout.addWidget(self.slider)

        # Fila Inferior: Presets rápidos y Botón de Mute
        footer_layout = QHBoxLayout()
        footer_layout.setSpacing(6)

        if self.mode == "volume":
            self.mute_btn = QPushButton("󰖁 Mute")
            self.mute_btn.setCursor(Qt.PointingHandCursor)
            self.mute_btn.clicked.connect(self.toggle_system_mute)
            footer_layout.addWidget(self.mute_btn)

        for p in self.presets:
            btn = QPushButton(f"{p}%")
            btn.setCursor(Qt.PointingHandCursor)
            btn.clicked.connect(lambda _, val=p: self.set_preset(val))
            footer_layout.addWidget(btn)

        main_layout.addLayout(footer_layout)

        # Aplicar hoja de estilos QSS Cyberpunk / One Dark
        container.setStyleSheet(f"""
            QWidget#Container {{
                background-color: #141820;
                border: 1.5px solid {self.accent_color};
                border-radius: 12px;
            }}
            QLabel#Title {{
                color: #e6edf3;
            }}
            QLabel#Value {{
                color: {self.accent_color};
            }}
            QSlider::groove:horizontal {{
                border: none;
                height: 8px;
                background: #232936;
                border-radius: 4px;
            }}
            QSlider::sub-page:horizontal {{
                background: qlineargradient(x1:0, y1:0, x2:1, y2:0, stop:0 {self.accent_color}, stop:1 {self.secondary_color});
                border-radius: 4px;
            }}
            QSlider::handle:horizontal {{
                background: #ffffff;
                border: 2px solid {self.accent_color};
                width: 18px;
                height: 18px;
                margin: -5px 0;
                border-radius: 9px;
            }}
            QSlider::handle:horizontal:hover {{
                background: #ffffff;
                border: 2px solid #ffffff;
            }}
            QPushButton {{
                background-color: #1e2430;
                color: #abb2bf;
                border: 1px solid #2b3342;
                border-radius: 6px;
                padding: 4px 6px;
                font-size: 10px;
                font-weight: bold;
            }}
            QPushButton:hover {{
                background-color: #2b3342;
                color: #ffffff;
                border: 1px solid {self.accent_color};
            }}
            QPushButton:pressed {{
                background-color: {self.accent_color};
                color: #141820;
            }}
        """)

    def set_preset(self, val):
        self.slider.setValue(val)

    def on_slider_changed(self, val):
        self.apply_system_value(val)
        self.update_labels(val, False)

    def sync_from_system(self):
        val, is_muted = self.get_system_state()
        self.slider.blockSignals(True)
        self.slider.setValue(val)
        self.slider.blockSignals(False)
        self.update_labels(val, is_muted)

    def update_labels(self, val, is_muted):
        if self.mode == "volume":
            if is_muted:
                self.icon_label.setText("󰖁")
                self.icon_label.setStyleSheet("color: #e06c75;")
                self.value_label.setText("MUTE")
                self.value_label.setStyleSheet("color: #e06c75;")
                if hasattr(self, "mute_btn"):
                    self.mute_btn.setText("󰕾 Unmute")
                    self.mute_btn.setStyleSheet("background-color: #e06c75; color: #ffffff;")
            else:
                if val >= 70:
                    icon = "󰕾"
                elif val >= 30:
                    icon = "󰖀"
                else:
                    icon = "󰕿"
                self.icon_label.setText(icon)
                self.icon_label.setStyleSheet(f"color: {self.accent_color};")
                self.value_label.setText(f"{val}%")
                self.value_label.setStyleSheet(f"color: {self.accent_color};")
                if hasattr(self, "mute_btn"):
                    self.mute_btn.setText("󰖁 Mute")
                    self.mute_btn.setStyleSheet("")
        else:
            if val >= 70:
                icon = "󰃠"
            elif val >= 30:
                icon = "󰃟"
            else:
                icon = "󰃞"
            self.icon_label.setText(icon)
            self.icon_label.setStyleSheet(f"color: {self.accent_color};")
            self.value_label.setText(f"{val}%")
            self.value_label.setStyleSheet(f"color: {self.accent_color};")

    def position_window(self):
        cursor = QCursor.pos()
        screen = QApplication.primaryScreen().geometry()
        w = self.width()
        h = self.height()

        # Centrar horizontalmente respecto al cursor del ratón, respetando márgenes
        x = cursor.x() - w // 2
        if x + w > screen.width() - 16:
            x = screen.width() - w - 16
        if x < 16:
            x = 16

        # Posicionamiento vertical: Justo debajo de Polybar (top 38px) o cerca del cursor
        if cursor.y() < 60:
            y = 38
        else:
            y = cursor.y() + 15
            if y + h > screen.height() - 16:
                y = cursor.y() - h - 10

        self.move(x, y)

    def keyPressEvent(self, event: QKeyEvent):
        if event.key() == Qt.Key_Escape:
            self.close()
        elif event.key() in (Qt.Key_Left, Qt.Key_Down):
            self.slider.setValue(max(self.slider.minimum(), self.slider.value() - 1))
        elif event.key() in (Qt.Key_Right, Qt.Key_Up):
            self.slider.setValue(min(self.slider.maximum(), self.slider.value() + 1))
        elif event.key() == Qt.Key_M and self.mode == "volume":
            self.toggle_system_mute()
        else:
            super().keyPressEvent(event)

    def changeEvent(self, event):
        # Auto-cerrar al perder el foco (hacer clic en cualquier otra parte del escritorio)
        if event.type() == QEvent.ActivationChange:
            if not self.isActiveWindow():
                self.close()
        super().changeEvent(event)


def manage_single_instance(mode):
    pid_file = f"/tmp/osd_slider_{mode}.pid"
    if os.path.exists(pid_file):
        try:
            with open(pid_file, "r") as f:
                old_pid = int(f.read().strip())
            # Si el proceso anterior sigue vivo, lo terminamos (comportamiento toggle) y salimos
            os.kill(old_pid, signal.SIGTERM)
            os.remove(pid_file)
            sys.exit(0)
        except Exception:
            try:
                os.remove(pid_file)
            except Exception:
                pass

    with open(pid_file, "w") as f:
        f.write(str(os.getpid()))

    def cleanup():
        try:
            if os.path.exists(pid_file):
                os.remove(pid_file)
        except Exception:
            pass

    import atexit
    atexit.register(cleanup)


def main():
    mode = "volume"
    if len(sys.argv) > 1 and sys.argv[1] in ("brightness", "brillo"):
        mode = "brightness"

    manage_single_instance(mode)

    app = QApplication(sys.argv)
    app.setApplicationName(f"OsdSlider_{mode}")

    window = OsdSliderWindow(mode=mode)
    window.show()
    window.raise_()
    window.activateWindow()

    sys.exit(app.exec_())


if __name__ == "__main__":
    main()
