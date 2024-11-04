from __future__ import annotations
from PySide6.QtWidgets import QFileSystemModel
from PySide6.QtQuick import QQuickTextDocument
from PySide6.QtQml import QmlElement, QmlSingleton
from PySide6.QtCore import (Qt, QObject, QDir, QAbstractListModel, Slot, QFile, QTextStream,
                            QMimeDatabase, QFileInfo, QStandardPaths, QModelIndex,
                            Signal, Property, QThread)

# import socket
# import time
import paramiko
# import threading
import select


QML_IMPORT_NAME = "MyBridge"
QML_IMPORT_MAJOR_VERSION = 1


@Slot(str)
def update_a_str_field(self, message):
    print("Testing: update_a_str_field >> ", message)


@Slot(int)
def update_a_int_field(self, value):
    print("testing: update_a_int_field >> ", value)


@Slot()
def testMessage():
    print("TEST - START")


@Slot()
def testMessageFinish():
    print("TEST - Finish")


# Signals must inherit QObject
class Communicate(QObject):
    signal_str = Signal(QObject, str)
    signal_int = Signal(QObject, int)


class Worker(QThread):
    def __init__(self, parent=None):
        QThread.__init__(self, parent)
        print("Init signals with parent: ", parent)
        self.signals = Communicate()
        # Connect the signals to the main thread slots
        # self.signals.signal_str.connect(update_a_str_field)
        # self.signals.signal_int.connect(update_a_int_field)

    def run(self):
        # ssh_client = paramiko.SSHClient()
        # ssh_client.load_system_host_keys()
        # ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        # ssh_client.connect(hostname='localhost',port='2222',username='ubuntu',password='ubuntu')
        # remote_command = 'tail -f ~/Downloads/test.txt'

        # transport = ssh_client.get_transport()
        # channel = transport.open_session()
        # channel.exec_command(remote_command)

        while True and (not self.isInterruptionRequested()):
            i = 0
            with open('testhahaha.txt', 'w') as f:
                f.truncate(0)
            while i < 10:
                i +=1
                self.sleep(1)
                print("i: ", i)
                with open('testhahaha.txt', 'a') as f:
                    f.write(str(i) + "\n")
            f.close()
            # break;
#             try:
#                 if channel.exit_status_ready():
#                     print("exit status ready. Maybe we're losing SSH connection")
#                     break
#                 rl, wl, xl = select.select([channel], [], [], 0.0)
#                 if len(rl) > 0:
#                     buf = channel.recv(1024)
# #                    print('buf:',  buf, ' > ', len(buf))
#                     LeftOver = ""
#                     if len(buf) > 0:
#                         lines_to_process = LeftOver + buf.decode()
#                         # print (line)
#                         EOL = lines_to_process.rfind("\n")
#                         if EOL != len(lines_to_process)-1:
#                             LeftOver = lines_to_process[EOL+1:]
#                             lines_to_process = lines_to_process[:EOL]
#                         else:
#                             LeftOver = ""
#                         for line in lines_to_process.splitlines():
#                             if "error" in line:
#                                 print("error: ", line)
#                             print(line)
#                             self.signals.signal_str.emit(self, line)
            # except (KeyboardInterrupt, SystemExit):
            #     print('got ctrl+c')
            #     break
        ssh_client.close()
        print('close ssh client')
        print("Thread is done")

    def __del__():
        print("Worker is destroyed")


@QmlElement
class Bridge(QObject):

    def __init__(self):
        super(Bridge, self).__init__()
        print("do init bridge")
        self._name = "NameBridge"
        self._tailerLog = "---"
        # Configuring separate thread
        self.tailer = Worker(self)
        self.tailer.started.connect(testMessage)
        self.tailer.finished.connect(testMessageFinish)
        self.tailer.signals.signal_str.connect(self.slotCommunicate)
        # self.tailer.signals.signal_str.connect(update_a_str_field)

    nameChanged = Signal()
    @Property(str, notify=nameChanged, final=True)
    def name(self):
        print("getter: ", self._name)
        return self._name

    @name.setter
    def name(self, value):
        if value != self._name:
            self._name = value
            self.nameChanged.emit()

    tailerLogChanged = Signal()
    @Property(str, notify=tailerLogChanged, final=True)
    def tailerLog(self):
        print("getter: ", self._tailerLog)
        return self._tailerLog

    @tailerLog.setter
    def tailerLog(self, value):
        print("setter: ", value)
        if value != self._tailerLog:
            self._tailerLog = value
            self.tailerLogChanged.emit()

    @Slot(str, result=str)
    def getColor(self, s):
        if s.lower() == "red":
            return "#ef9a9a"
        if s.lower() == "green":
            return "#a5d6a7"
        if s.lower() == "blue":
            return "#90caf9"
        return "white"

    @Slot(float, result=int)
    def getSize(self, s):
        size = int(s * 34)
        return max(1, size)

    @Slot(str, result=bool)
    def getItalic(self, s):
        print("getItalic >> ", self, ", s: ", s)
        self._name += s
        self.nameChanged.emit()
        self._tailerLog += s
        self.tailerLogChanged.emit()
        print("checking thread:", self.tailer.isRunning())
        if (self.tailer.isRunning()):
            print("Quit thread")
            self.tailer.requestInterruption()
        if (not self.tailer.isRunning()):
            print("Re-start thread")
            self.tailer.start()
        return s.lower() == "italic"

    @Slot(str, result=bool)
    def getBold(self, s):
        return s.lower() == "bold"

    @Slot(str, result=bool)
    def getUnderline(self, s):
        return s.lower() == "underline"

    @Slot(str)
    def slotCommunicate(selfSlot, selfSignal, str):
        print("slotCommunicate: from ", selfSignal, "to ", selfSlot, ", str: ", str)
        # selfSlot.tailerLog(selfSlot, str)
        # selfSlot._tailerLog += "\n" + str
        # selfSlot.tailerLogChanged.emit()
        setattr(selfSlot, "tailerLog", selfSlot._tailerLog + "\n" + str)

