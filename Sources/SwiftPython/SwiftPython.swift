// The Swift Programming Language
// https://docs.swift.org/swift-book
import PythonBridge
import PythonKit

public func startPythonInterpreter() {
    importPythonAndRunInterpreter()
    if let scriptDirectory = Bundle.main.resourcePath {
        let sys = Python.import("sys")
        // Add app's resource path to Python's module search path
        sys.path.append(scriptDirectory)
        
        let packageDirectory = "\(scriptDirectory)/Frameworks/Python.framework/builtin_packages"
        print("Adding \(packageDirectory)")
        sys.path.append(packageDirectory)
        
    } else {
        print("Error: Could not find main bundle directory, Python scripts might not be available.")
    }
}


