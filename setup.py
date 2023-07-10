from distutils.core import setup, Extension
from Cython.Build import cythonize

# 我们只导入了一个头文件, 但是头文件不需要关心
ext = [Extension("tolib",
                 sources=["tolib.pyx"],
                 )]

setup(name="tolib", ext_modules=cythonize(ext, language_level=3))

