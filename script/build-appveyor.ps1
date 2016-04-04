Write-Host Running Powershell script !
Set-PSDebug -Trace 1

$DATE = $env:APPVEYOR_REPO_COMMIT_TIMESTAMP.substring(0,10)
$TIME = $env:APPVEYOR_REPO_COMMIT_TIMESTAMP.substring(11,8).replace(':','-')
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

Write-Host c:\projects\JamomaMax\cmake-3.4.1-rc4-win32-x86\bin\cmake.exe -G $env:CMAKE_GENERATOR $env:CUSTOM_FLAG  -DCMAKE_INSTALL_PREFIX=$pwd/JamomaInstall -DCMAKE_BUILD_TYPE=Release ..

# TODO : find a way to use variable instead of full path
c:\projects\JamomaMax\cmake-3.4.1-win32-x86\bin\cmake.exe -G $env:CMAKE_GENERATOR $env:CUSTOM_FLAG  -DCMAKE_INSTALL_PREFIX=c:\projects\JamomaMax\build\JamomaInstall -DCMAKE_BUILD_TYPE=Release .. > c:\projects\JamomaMax\configure.log
c:\projects\JamomaMax\cmake-3.4.1-win32-x86\bin\cmake.exe --build . --config Release > c:\projects\JamomaMax\build.log
c:\projects\JamomaMax\cmake-3.4.1-win32-x86\bin\cmake.exe --build . --config Release --target install > c:\projects\JamomaMax\install.log

if ( $env:APPVEYOR_REPO_TAG -eq "true" ){
    Write-Host "This is a release deployment with tag $env:APPVEYOR_REPO_TAG_NAME"
    $archiveName = "JamomaMax-Windows_$env:PLATFORM-Release-$env:APPVEYOR_REPO_TAG_NAME.zip"
} else {
    Write-Host "This is debug deployment."
    $sha = $env:APPVEYOR_REPO_COMMIT.Substring(0,7)
    $archiveName = "JamomaMax-$DATE-Windows_$env:PLATFORM.zip"
}

cd c:/projects/JamomaMax/build/JamomaInstall/JamomaMax/
7z a $archiveName Jamoma > c:\projects\JamomaMax\archive.log
Move-Item *.zip $env:APPVEYOR_BUILD_FOLDER -force
cd $env:APPVEYOR_BUILD_FOLDER

# call deploy script in build step so that the deploy log could be upload with others
c:\projects\JamomaMax\script\deploy-appveyor.ps1
