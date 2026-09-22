#!/usr/bin/env python3
# ==============================================================================
# OSD SLIDER PRO - POPUP INTERACTIVO PARA VOLUMEN Y BRILLO (FLUENT MICA)
# BSPWM / Polybar / Parrot OS Suite
# Permite interacción 100% con ratón (clic directo, arrastre continuo y scroll)
# Fix BSPWM: Inmune a focus_follows_pointer. Control por temporizador inteligente.
# ==============================================================================

import sys
import os
import signal
import subprocess
from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout,
    QLabel, QSlider, QPushButton
)
from PyQt5.QtCore import Qt, QTimer
from PyQt5.QtGui import QCursor, QFont, QKeyEvent

class ClickableSlider(QSlider):
    """QSlider táctil y de ratón con alta precisión y respuesta continua:
    Permite clic directo en cualquier punto, arrastre continuo con botón presionado y scroll."""
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._dragging = False

    def _val_from_event(self, event):
        w = max(1, self.width())
        pos = max(0, min(w, event.x()))
        span = self.maximum() - self.minimum()
        val = self.minimum() + int(round((pos * span) / w))
        return max(self.minimum(), min(self.maximum(), val))

    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            self._dragging = True
            new_val = self._val_from_event(event)
            self.setValue(new_val)
            event.accept()
        else:
            super().mousePressEvent(event)

    def mouseMoveEvent(self, event):
        if self._dragging and (event.buttons() & Qt.LeftButton):
            new_val = self._val_from_event(event)
            self.setValue(new_val)
            event.accept()
        else:
            super().mouseMoveEvent(event)

    def mouseReleaseEvent(self, event):
        if event.button() == Qt.LeftButton:
            self._dragging = False
            new_val = self._val_from_event(event)
            self.setValue(new_val)
            event.accept()
            # Si al soltar el ratón el cursor está fuera de la ventana padre, iniciar timer de salida
            win = self.window()
            if hasattr(win, "close_timer") and not win.rect().contains(win.mapFromGlobal(QCursor.pos())):
                win.close_timer.start(1500)
        else:
            super().mouseReleaseEvent(event)

    def wheelEvent(self, event):
        delta = event.angleDelta().y()
        step = 2 if delta > 0 else -2
        self.setValue(max(self.minimum(), min(self.maximum(), self.value() + step)))
        event.accept()


class OsdSliderWindow(QWidget):
    def __init__(self, mode="volume"):
        super().__init__()
        self.mode = mode
        self.setObjectName(f"OsdSlider_{mode}")
        self.setWindowTitle(f"OsdSlider_{mode}")

        # Configuración de ventana flotante sin bordes
        self.setWindowFlags(
            Qt.FramelessWindowHint |
            Qt.WindowStaysOnTopHint |
            Qt.Tool
        )
        self.setAttribute(Qt.WA_TranslucentBackground, True)
        self.setAttribute(Qt.WA_ShowWithoutActivating, False)

        # Temporizador inteligente de cierre:
        # Da 4 segundos iniciales para alcanzar la ventana con el ratón.
        # Si el ratón entra (enterEvent), se cancela y se mantiene abierta.
        # Al salir del área de la ventana (leaveEvent), espera 1.5s antes de cerrarse.
        self.close_timer = QTimer(self)
        self.close_timer.setSingleShot(True)
        self.close_timer.timeout.connect(self.close)
        self.close_timer.start(4000)

        # Paleta de colores Windows 11 Fluent Mica
        if self.mode == "volume":
            self.accent_color = "#60cdff"      # Luminous Fluent Blue
            self.secondary_color = "#4cc2ff"
            self.title_text = "Volumen"
            self.icon_default = "󰕾"
            self.presets = [20, 40, 60, 80, 100]
        else:
            self.accent_color = "#e5c07b"      # Amber Gold
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
        self.title_label.setFont(QFont("Segoe UI Variable", 10, QFont.Bold))

        self.value_label = QLabel("0%")
        self.value_label.setObjectName("Value")
        self.value_label.setFont(QFont("Segoe UI Variable", 11, QFont.Bold))
        self.value_label.setAlignment(Qt.AlignRight | Qt.AlignVCenter)

        header_layout.addWidget(self.icon_label)
        header_layout.addWidget(self.title_label)
        header_layout.addStretch()
        header_layout.addWidget(self.value_label)
        main_layout.addLayout(header_layout)

        # Fila Central: Slider interactivo de ratón
        self.slider = ClickableSlider(Qt.Horizontal)
        self.slider.setRange(0 if self.mode == "volume" else 1, 100)
        self.slider.setFixedHeight(28)
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

        # Aplicar hoja de estilos QSS Windows 11 Fluent Mica
        container.setStyleSheet(f"""
            QWidget#Container {{
                background-color: #1f1f1ff6;
                border: 1px solid #ffffff25;
                border-radius: 12px;
            }}
            QLabel#Title {{
                color: #ffffff;
            }}
            QLabel#Value {{
                color: {self.accent_color};
            }}
            QSlider::groove:horizontal {{
                border: none;
                height: 6px;
                background: #333333;
                border-radius: 3px;
            }}
            QSlider::sub-page:horizontal {{
                background: {self.accent_color};
                border-radius: 3px;
            }}
            QSlider::handle:horizontal {{
                background: #ffffff;
                border: 3px solid {self.accent_color};
                width: 18px;
                height: 18px;
                margin: -6px 0;
                border-radius: 9px;
            }}
            QSlider::handle:horizontal:hover {{
                background: #ffffff;
                border: 3px solid #ffffff;
            }}
            QPushButton {{
                background-color: #2b2b2b;
                color: #cfcfcf;
                border: 1px solid #383838;
                border-radius: 6px;
                padding: 5px 8px;
                font-size: 10px;
                font-weight: bold;
            }}
            QPushButton:hover {{
                background-color: #383838;
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
        if self.close_timer.isActive():
            self.close_timer.stop()

    def on_slider_changed(self, val):
        self.apply_system_value(val)
        self.update_labels(val, False)
        if self.close_timer.isActive():
            self.close_timer.stop()

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
                self.icon_label.setStyleSheet("color: #ff99a4;")
                self.value_label.setText("MUTE")
                self.value_label.setStyleSheet("color: #ff99a4;")
                if hasattr(self, "mute_btn"):
                    self.mute_btn.setText("󰕾 Unmute")
                    self.mute_btn.setStyleSheet("background-color: #ff99a4; color: #1f1f1f;")
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
        screen = QApplication.primaryScreen().geometry()
        w = self.width()
        h = self.height()

        # En Windows 11 Taskbar, el flyout de volumen/brillo se ancla en
        # la esquina inferior derecha justo encima de la barra
        x = screen.width() - w - 16
        y = screen.height() - h - 48

        self.move(x, y)

    def enterEvent(self, event):
        # El ratón entra en la ventana: cancelar el temporizador de cierre
        if self.close_timer.isActive():
            self.close_timer.stop()
        super().enterEvent(event)

    def leaveEvent(self, event):
        # El ratón sale de la ventana: dar 1.5s antes de cerrar (a menos que esté arrastrando el slider)
        if not getattr(self.slider, '_dragging', False):
            self.close_timer.start(1500)
        super().leaveEvent(event)

    def keyPressEvent(self, event: QKeyEvent):
        if event.key() in (Qt.Key_Escape, Qt.Key_Return):
            self.close()
        elif event.key() in (Qt.Key_Left, Qt.Key_Down):
            self.slider.setValue(max(self.slider.minimum(), self.slider.value() - 1))
        elif event.key() in (Qt.Key_Right, Qt.Key_Up):
            self.slider.setValue(min(self.slider.maximum(), self.slider.value() + 1))
        elif event.key() == Qt.Key_M and self.mode == "volume":
            self.toggle_system_mute()
        else:
            super().keyPressEvent(event)


def manage_single_instance(mode):
    pid_file = f"/tmp/osd_slider_{mode}.pid"
    if os.path.exists(pid_file):
        try:
            with open(pid_file, "r") as f:
                old_pid = int(f.read().strip())
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
