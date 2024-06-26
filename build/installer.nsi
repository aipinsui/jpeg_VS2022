!include x64.nsh
Name "libjpeg-turbo SDK for Visual C++ 64-bit"
OutFile "E:/jpeg_VS2022/build\${BUILDDIR}libjpeg-turbo-3.0.3-vc64.exe"
InstallDir "E:\jpeg_VS2022\package"

SetCompressor bzip2

Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "libjpeg-turbo SDK for Visual C++ 64-bit (required)"
!ifdef WIN64
	${If} ${RunningX64}
	${DisableX64FSRedirection}
	${Endif}
!endif
	SectionIn RO
!ifdef GCC
	IfFileExists $SYSDIR/libturbojpeg.dll exists 0
!else
	IfFileExists $SYSDIR/turbojpeg.dll exists 0
!endif
	goto notexists
	exists:
!ifdef GCC
	MessageBox MB_OK "An existing version of the libjpeg-turbo SDK for Visual C++ 64-bit is already installed.  Please uninstall it first."
!else
	MessageBox MB_OK "An existing version of the libjpeg-turbo SDK for Visual C++ 64-bit or the TurboJPEG SDK is already installed.  Please uninstall it first."
!endif
	quit

	notexists:
	SetOutPath $SYSDIR
!ifdef GCC
	File "E:/jpeg_VS2022/build\libturbojpeg.dll"
!else
	File "E:/jpeg_VS2022/build\${BUILDDIR}turbojpeg.dll"
!endif
	SetOutPath $INSTDIR\bin
!ifdef GCC
	File "E:/jpeg_VS2022/build\libturbojpeg.dll"
!else
	File "E:/jpeg_VS2022/build\${BUILDDIR}turbojpeg.dll"
!endif
!ifdef GCC
	File "E:/jpeg_VS2022/build\libjpeg-62.dll"
!else
	File "E:/jpeg_VS2022/build\${BUILDDIR}jpeg62.dll"
!endif
	File "E:/jpeg_VS2022/build\${BUILDDIR}cjpeg.exe"
	File "E:/jpeg_VS2022/build\${BUILDDIR}djpeg.exe"
	File "E:/jpeg_VS2022/build\${BUILDDIR}jpegtran.exe"
	File "E:/jpeg_VS2022/build\${BUILDDIR}tjbench.exe"
	File "E:/jpeg_VS2022/build\${BUILDDIR}rdjpgcom.exe"
	File "E:/jpeg_VS2022/build\${BUILDDIR}wrjpgcom.exe"
	SetOutPath $INSTDIR\lib
!ifdef GCC
	File "E:/jpeg_VS2022/build\libturbojpeg.dll.a"
	File "E:/jpeg_VS2022/build\libturbojpeg.a"
	File "E:/jpeg_VS2022/build\libjpeg.dll.a"
	File "E:/jpeg_VS2022/build\libjpeg.a"
!else
	File "E:/jpeg_VS2022/build\${BUILDDIR}turbojpeg.lib"
	File "E:/jpeg_VS2022/build\${BUILDDIR}turbojpeg-static.lib"
	File "E:/jpeg_VS2022/build\${BUILDDIR}jpeg.lib"
	File "E:/jpeg_VS2022/build\${BUILDDIR}jpeg-static.lib"
!endif
	SetOutPath $INSTDIR\lib\pkgconfig
	File "E:/jpeg_VS2022/build\pkgscripts\libjpeg.pc"
	File "E:/jpeg_VS2022/build\pkgscripts\libturbojpeg.pc"
	SetOutPath $INSTDIR\lib\cmake\libjpeg-turbo
	File "E:/jpeg_VS2022/build\pkgscripts\libjpeg-turboConfig.cmake"
	File "E:/jpeg_VS2022/build\pkgscripts\libjpeg-turboConfigVersion.cmake"
	File "E:/jpeg_VS2022/build\win\libjpeg-turboTargets.cmake"
	File "E:/jpeg_VS2022/build\win\libjpeg-turboTargets-release.cmake"
!ifdef JAVA
	SetOutPath $INSTDIR\classes
	File "E:/jpeg_VS2022/build\java\turbojpeg.jar"
!endif
	SetOutPath $INSTDIR\include
	File "E:/jpeg_VS2022/build\jconfig.h"
	File "E:/jpeg_VS2022\jerror.h"
	File "E:/jpeg_VS2022\jmorecfg.h"
	File "E:/jpeg_VS2022\jpeglib.h"
	File "E:/jpeg_VS2022\turbojpeg.h"
	SetOutPath $INSTDIR\doc
	File "E:/jpeg_VS2022\README.ijg"
	File "E:/jpeg_VS2022\README.md"
	File "E:/jpeg_VS2022\LICENSE.md"
	File "E:/jpeg_VS2022\example.c"
	File "E:/jpeg_VS2022\libjpeg.txt"
	File "E:/jpeg_VS2022\structure.txt"
	File "E:/jpeg_VS2022\usage.txt"
	File "E:/jpeg_VS2022\wizard.txt"
	File "E:/jpeg_VS2022\tjexample.c"
	File "E:/jpeg_VS2022\java\TJExample.java"
!ifdef GCC
	SetOutPath $INSTDIR\man\man1
	File "E:/jpeg_VS2022\cjpeg.1"
	File "E:/jpeg_VS2022\djpeg.1"
	File "E:/jpeg_VS2022\jpegtran.1"
	File "E:/jpeg_VS2022\rdjpgcom.1"
	File "E:/jpeg_VS2022\wrjpgcom.1"
!endif

	WriteRegStr HKLM "SOFTWARE\libjpeg-turbo64 3.0.3" "Install_Dir" "$INSTDIR"

	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\libjpeg-turbo64 3.0.3" "DisplayName" "libjpeg-turbo SDK v3.0.3 for Visual C++ 64-bit"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\libjpeg-turbo64 3.0.3" "UninstallString" '"$INSTDIR\uninstall_3.0.3.exe"'
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\libjpeg-turbo64 3.0.3" "NoModify" 1
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\libjpeg-turbo64 3.0.3" "NoRepair" 1
	WriteUninstaller "uninstall_3.0.3.exe"
SectionEnd

Section "Uninstall"
!ifdef WIN64
	${If} ${RunningX64}
	${DisableX64FSRedirection}
	${Endif}
!endif

	SetShellVarContext all

	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\libjpeg-turbo64 3.0.3"
	DeleteRegKey HKLM "SOFTWARE\libjpeg-turbo64 3.0.3"

!ifdef GCC
	Delete $INSTDIR\bin\libjpeg-62.dll
	Delete $INSTDIR\bin\libturbojpeg.dll
	Delete $SYSDIR\libturbojpeg.dll
	Delete $INSTDIR\lib\libturbojpeg.dll.a
	Delete $INSTDIR\lib\libturbojpeg.a
	Delete $INSTDIR\lib\libjpeg.dll.a
	Delete $INSTDIR\lib\libjpeg.a
!else
	Delete $INSTDIR\bin\jpeg62.dll
	Delete $INSTDIR\bin\turbojpeg.dll
	Delete $SYSDIR\turbojpeg.dll
	Delete $INSTDIR\lib\jpeg.lib
	Delete $INSTDIR\lib\jpeg-static.lib
	Delete $INSTDIR\lib\turbojpeg.lib
	Delete $INSTDIR\lib\turbojpeg-static.lib
!endif
	Delete $INSTDIR\lib\pkgconfig\libjpeg.pc
	Delete $INSTDIR\lib\pkgconfig\libturbojpeg.pc
	Delete $INSTDIR\lib\cmake\libjpeg-turbo\libjpeg-turboConfig.cmake
	Delete $INSTDIR\lib\cmake\libjpeg-turbo\libjpeg-turboConfigVersion.cmake
	Delete $INSTDIR\lib\cmake\libjpeg-turbo\libjpeg-turboTargets.cmake
	Delete $INSTDIR\lib\cmake\libjpeg-turbo\libjpeg-turboTargets-release.cmake
!ifdef JAVA
	Delete $INSTDIR\classes\turbojpeg.jar
!endif
	Delete $INSTDIR\bin\cjpeg.exe
	Delete $INSTDIR\bin\djpeg.exe
	Delete $INSTDIR\bin\jpegtran.exe
	Delete $INSTDIR\bin\tjbench.exe
	Delete $INSTDIR\bin\rdjpgcom.exe
	Delete $INSTDIR\bin\wrjpgcom.exe
	Delete $INSTDIR\include\jconfig.h
	Delete $INSTDIR\include\jerror.h
	Delete $INSTDIR\include\jmorecfg.h
	Delete $INSTDIR\include\jpeglib.h
	Delete $INSTDIR\include\turbojpeg.h
	Delete $INSTDIR\uninstall_3.0.3.exe
	Delete $INSTDIR\doc\README.ijg
	Delete $INSTDIR\doc\README.md
	Delete $INSTDIR\doc\LICENSE.md
	Delete $INSTDIR\doc\example.c
	Delete $INSTDIR\doc\libjpeg.txt
	Delete $INSTDIR\doc\structure.txt
	Delete $INSTDIR\doc\usage.txt
	Delete $INSTDIR\doc\wizard.txt
	Delete $INSTDIR\doc\tjexample.c
	Delete $INSTDIR\doc\TJExample.java
!ifdef GCC
	Delete $INSTDIR\man\man1\cjpeg.1
	Delete $INSTDIR\man\man1\djpeg.1
	Delete $INSTDIR\man\man1\jpegtran.1
	Delete $INSTDIR\man\man1\rdjpgcom.1
	Delete $INSTDIR\man\man1\wrjpgcom.1
!endif

	RMDir "$INSTDIR\include"
	RMDir "$INSTDIR\lib\pkgconfig"
	RMDir "$INSTDIR\lib\cmake\libjpeg-turbo"
	RMDir "$INSTDIR\lib\cmake"
	RMDir "$INSTDIR\lib"
	RMDir "$INSTDIR\doc"
!ifdef GCC
	RMDir "$INSTDIR\man\man1"
	RMDir "$INSTDIR\man"
!endif
!ifdef JAVA
	RMDir "$INSTDIR\classes"
!endif
	RMDir "$INSTDIR\bin"
	RMDir "$INSTDIR"

SectionEnd
