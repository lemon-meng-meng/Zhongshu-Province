# src/main.py
import sys
import gi
gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
from gi.repository import Gtk, Adw
from window import MainWindow

class ZhongshuApp(Adw.Application):
    def __init__(self):
        super().__init__(application_id='com.example.zhongshu')
        self.connect('activate', self.on_activate)

    def on_activate(self, app):
        window = MainWindow(app)
        window.present()

if __name__ == '__main__':
    app = ZhongshuApp()
    app.run(None)