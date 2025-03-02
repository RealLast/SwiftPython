.PHONY: all
all: python_library

.PHONY: python_library
python_library: 
	rm -fr PythonFramework/compile/pythonframework/build
	rm -fr PythonFramework/prebuilt/
	
	@echo "Building python binary"
	cd PythonFramework/compile/pythonframework && briefcase create ios
	cd PythonFramework/compile/pythonframework && briefcase build ios

	@echo "Copying python binary"
	mkdir -p PythonFramework/prebuilt
	cp -r PythonFramework/compile/pythonframework/build/pythonframework/ios/xcode/Support/Python.xcframework PythonFramework/prebuilt/Python.xcframework

	mv PythonFramework/prebuilt/Python.xcframework/ios-arm64/lib  PythonFramework/prebuilt/Python.xcframework/ios-arm64/Python.framework/lib

	mv PythonFramework/prebuilt/Python.xcframework/ios-arm64_x86_64-simulator/lib PythonFramework/prebuilt/Python.xcframework/ios-arm64_x86_64-simulator/Python.framework/lib

	mv PythonFramework/prebuilt/Python.xcframework/iphoneos/lib PythonFramework/prebuilt/Python.xcframework/iphoneos/Python.framework/lib

	mv PythonFramework/prebuilt/Python.xcframework/iphonesimulator/lib PythonFramework/prebuilt/Python.xcframework/iphonesimulator/Python.framework/lib

	@echo "Copying builtin python packages"
	cp -r PythonFramework/compile/pythonframework/build/pythonframework/ios/xcode/PythonFramework/app_packages.iphoneos PythonFramework/prebuilt/Python.xcframework/ios-arm64/Python.framework/builtin_packages

	cp -r PythonFramework/compile/pythonframework/build/pythonframework/ios/xcode/PythonFramework/app_packages.iphoneos PythonFramework/prebuilt/Python.xcframework/iphoneos/Python.framework/builtin_packages

	cp -r PythonFramework/compile/pythonframework/build/pythonframework/ios/xcode/PythonFramework/app_packages.iphonesimulator PythonFramework/prebuilt/Python.xcframework/iphonesimulator/Python.framework/builtin_packages

	cp -r PythonFramework/compile/pythonframework/build/pythonframework/ios/xcode/PythonFramework/app_packages.iphonesimulator PythonFramework/prebuilt/Python.xcframework/ios-arm64_x86_64-simulator/Python.framework/builtin_packages