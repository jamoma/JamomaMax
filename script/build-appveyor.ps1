Write-Host Running Powershell script !
Set-PSDebug -Trace 1

$env:DATE = $env:APPVEYOR_REPO_COMMIT_TIMESTAMP.substring(0,10)
$env:TIME = $env:APPVEYOR_REPO_COMMIT_TIMESTAMP.substring(11,8).replace(':','-')
$env:CMAKE = $env:CMAKE_PATH + "\bin\cmake.exe"
if ( $env:PLATFORM -eq "x64" ) {
  $env:CMAKE_GENERATOR = "Visual Studio 12 2013 Win64"
  $env:CUSTOM_FLAG = "-DWIN64:Bool=True"
} else {
  $env:CMAKE_GENERATOR = "Visual Studio 12 2013"
  $env:CUSTOM_FLAG = ""
}

openssl aes-256-cbc -K $env:encrypted_key -iv $env:encrypted_iv -in c:\projects\JamomaMax\script\id_rsa-appveyor.enc -out id_rsa -d
git submodule init
git submodule update
mkdir build
cd build

Write-Host c:\projects\JamomaMax\cmake-3.3.0-rc4-win32-x86\bin\cmake.exe -G $env:CMAKE_GENERATOR $env:CUSTOM_FLAG  -DCMAKE_INSTALL_PREFIX=$pwd/JamomaInstall -DCMAKE_BUILD_TYPE=Release ..

# TODO : find a way to use variable instead of full path
c:\projects\JamomaMax\cmake-3.3.0-rc4-win32-x86\bin\cmake.exe -G $env:CMAKE_GENERATOR $env:CUSTOM_FLAG  -DCMAKE_INSTALL_PREFIX=c:\projects\JamomaMax\build\JamomaInstall -DCMAKE_BUILD_TYPE=Release .. > c:\projects\JamomaMax\configure.log
c:\projects\JamomaMax\cmake-3.3.0-rc4-win32-x86\bin\cmake.exe --build . > c:\projects\JamomaMax\build.log
c:\projects\JamomaMax\cmake-3.3.0-rc4-win32-x86\bin\cmake.exe --build . --target install > c:\projects\JamomaMax\install.log

if ( $env:APPVEYOR_REPO_TAG -eq "true" ){
    Write-Host "This is a release deployment with tag $env:APPVEYOR_REPO_TAG_NAME"
    $archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-Release-$env:APPVEYOR_REPO_TAG_NAME.zip"
} else {
    Write-Host "This is debug deployment."
    $archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-$env:APPVEYOR_REPO_COMMIT.substring(0,7).zip"
}

cd c:/projects/JamomaMax/build/JamomaInstall/JamomaMax/
7z a $archiveName Jamoma > c:\projects\JamomaMax\archive.log
move /Y $archiveName $env:APPVEYOR_BUILD_FOLDER
cd $env:APPVEYOR_BUILD_FOLDER
