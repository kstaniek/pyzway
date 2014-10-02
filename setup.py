from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
    name="PyZberry",
    version="1.0.0.0",
    description="Cython wrapper for RaZberry C API",
    author="Vladimir Smirnov",
    author_email="vladimir@smirnov.im",
    url="https://github.com/mindcollapse/razberry-python",
    license="BSD",
    platforms=["raspberry-pi"],
    ext_modules=cythonize([
        Extension(
            "zway", ["pyzberry/zway.pyx"],
            include_dirs=["/opt/z-way-server/libzway-dev"],
            library_dirs=["/opt/z-way-server/libs"],
            libraries=["zway", "pthread", "xml2", "z", "m", "crypto", "archive"]
        )
    ])
)