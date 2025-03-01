# SwiftPython – Seamless Python Integration for iOS
SwiftPython makes it easy to integrate Python into iOS applications, enabling Swift apps to call Python functions and run custom scripts. This package provides:

1. A pre-built Python library that embeds a Python interpreter directly into iOS applications.
2. Built-in support for popular Python packages, including NumPy and pandas.
3. A build script for customizing the Python library with additional packages (see below).
4. Interaction between Swift and Python via PythonKit.

**The default version is Python 3.10.**

## Installation
As with any other Swift package, 

## Supported Python packages

### Packages included in the prebuilt binary

### How can I include further python packages?
If you want to add more python packages, you need to build the Python binary from scratch (see below). The Python binary is built using [briefcase](https://beeware.org/project/briefcase/). It supports including Python packages from [pypi](https://pypi.org/). You can include any pip package as long as, either:
1. The package is python-only, which is true for most packages.
2. Or, the package is not python-only but is supported by briefcase, check here: [supported python packages with native components](https://anaconda.org/beeware/repo). 

## Building the python binary from scratch (to include more packages).