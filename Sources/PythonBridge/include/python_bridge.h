#pragma once
#import <Foundation/Foundation.h>
#include <Python/Python.h>

#include <dlfcn.h>


void crash_dialog(NSString *details);
NSString *format_traceback(PyObject *type, PyObject *value, PyObject *traceback);
int runPythonApp();

void importPythonAndRunInterpreter();

int runPythonApp();
void crash_dialog(NSString *details);
NSString *format_traceback(PyObject *type, PyObject *value, PyObject *traceback);

