//
//  SwiftPythonDemoAppApp.swift
//  SwiftPythonDemoApp
//
//  Created by Patrick Langer on 28.02.2025.
//

import SwiftUI
import SwiftPython
import PythonKit
@main
struct SwiftPythonDemoAppApp: App {
    
    var pythonText = ""
    var body: some Scene {
        WindowGroup {
            ContentView()
            Text(pythonText)
        }
    }
    
    init() {
        SwiftPython.startPythonInterpreter()
        
        let myModule = Python.import("MyPythonModule")
        let result = myModule.say_hello("Hello World")
        pythonText = "\(result)"
    }
    
    func printPythonVersion() {
        let sys = Python.import("sys")
        let text = ("Python \(sys.version_info.major).\(sys.version_info.minor)")
        print("Got Python version \(text)")
    }
}




