@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\sweet-Drivers-Release
REM mkdir ..\..\sweet-Drivers-Release

mkdir sweet-Drivers-Full
mkdir sweet-Drivers-Full\components
mkdir sweet-Drivers-Full\definitions
xcopy /cheriky ..\components\QC7150 sweet-Drivers-Full\components\QC7150\sweet
xcopy /cheriky ..\definitions\Desktop sweet-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\sweet-Drivers-Release\sweet-Drivers-Full.zip sweet-Drivers-Full\*

REM move sweet-Drivers-Full\components\QC7150 ..\components\QC7150
REM move sweet-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S sweet-Drivers-Full
