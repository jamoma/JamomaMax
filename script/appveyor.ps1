Write-Host Running Powershell script !

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

c:\projects\JamomaMax\cmake-3.3.0-rc4-win32-x86\bin\cmake.exe -G $env:CMAKE_GENERATOR $env:CUSTOM_FLAG  -DCMAKE_INSTALL_PREFIX=$pwd/JamomaInstall -DCMAKE_BUILD_TYPE=Release ..

if ( -Not $env:APPVEYOR_REPO_BRANCH -eq "master"){
	Write-Host "We are not on master branch. Don't deploy."
	exit
} else {
  Write-Host "Starting deployment..."
}

if ( $env:APPVEYOR_REPO_TAG ){
	Write-Host "This is a release deployment."
	$archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-Release-$env:APPVEYOR_REPO_TAG_NAME.zip"
  $destFolder = "/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/releases/"
} else {
	Write-Host "This is debug deployment."
	$archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-$env:APPVEYOR_REPO_COMMIT.substring(0,7).zip"
  $destFolder = "/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/nightly-builds/"
}

cmake -DBUILD_TYPE=Release -DCMAKE_INSTALL_COMPONENT=JamomaMax -P cmake_install.cmake > nul
cd JamomaInstall\JamomaMax
7z a $archiveName Jamoma > nul
move /Y $archiveName.zip %APPVEYOR_BUILD_FOLDER%
cd  %APPVEYOR_BUILD_FOLDER%
c:\projects\JamomaMax\WinScp.com /command "option batch abort" "open sftp://jamomabuild@thor.bek.no/ -privatekey=id_rsa -hostkey=""ssh-rsa 2048 d1:79:9a:fd:b5:8d:f5:5e:ae:05:6d:92:6c:6f:06:ff""" "put $archiveName $destFolder" "exit"
