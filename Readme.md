# iDebugTool (DDMS-like for IOS Platform)
This project is debugging tool for ios developmont based on [libimobiledevice](https://github.com/libimobiledevice-win32/libimobiledevice-vs) project and work cross platform (windows and linux).


### Features
+ Device Information
+ Live Log
+ App Manager (Install / Uninstall)
+ Copy crashlogs from device


### Requirement
+ iTunes (Windows only)
+ JDK 1.8.0 with JavaFX included
<br>Oracle JDK bundled JavaFX, if you use OpenJDK patch with  or install OpenJFX via package manager for linux system


### OpenJFX Quick Tips
Since JavaFX 8 is not included OpenJDK Package and latest linux distribution (ex. Ubuntu 20.04) OpenJFX 8 doesn't exist on package manager.
you need to patch your OpenJDK with OpenJFX files.

#### For Windows
+ Download [OpenJFX for Windows](https://github.com/scoop-software/openjfx-win/releases/download/openjfx-v8u202-b02/openjfx-sdk-8u202-b02.zip)
+ Open downloaded OpenJFX zip file
+ Extract folder "lib" and "bin" to root of your OpenJDK 8
+ Go to "rt" folder inside zip, extract folder "lib" and "bin" to jre of your OpenJDK 8

#### For Linux (tested on Ubuntu 20.04)
+ Download [OpenJFX for Linux](https://www.archlinux.org/packages/extra/x86_64/java8-openjfx/download)
+ Open downloaded OpenJFX package file
+ Inside package file, go to "/usr/lib/jvm/java-8-openjdk/" and you will found "lib", "bin", and "jre"
+ Extract them to your "/usr/lib/jvm/java-8-openjdk/" linux system


### How to use
#### For Windows
+ Run script "run_windows.bat"

#### For Linux (tested on Ubuntu 20.04)
+ In first time, you need set per mission executable.
<br>`hazmi@LinuxBox:~/Downloads/iDebugTool$ chmod -R +x .`<br>
+ Run script "run_linux" using bash 
<br>`hazmi@LinuxBox:~/Downloads/iDebugTool$ bash ./run_linux`<br>


by hazmi-e205
<br>Call me anytime if you have any question hazmiarifin@gmail.com
