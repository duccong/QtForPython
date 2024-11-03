# This Python file uses the following encoding: utf-8
from __future__ import annotations

import os
from pathlib import Path
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from bridge import Bridge

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # Include the path of this file to search for the 'qmldir' module
    engine.addImportPath(sys.path[0])

#    engine.loadFromModule("/", "Main")
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    if not engine.rootObjects():
        sys.exit(-1)
    ex = app.exec()
    del engine
    sys.exit(ex)
