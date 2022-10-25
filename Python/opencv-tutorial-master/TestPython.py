import numpy
import ctypes  # An included library with Python install.

#numpy.__version__
def Mbox(title, text, style):
    return ctypes.windll.user32.MessageBoxW(0, text, title, style)
Mbox('Your title', str(numpy.__version__), 1)