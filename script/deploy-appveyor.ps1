# TODO fix the installation path
cd JamomaInstall\jamoma\JamomaMax
7z a $archiveName Jamoma > c:\projects\JamomaMax\archive.log
move /Y $archiveName.zip $env:APPVEYOR_BUILD_FOLDER
cd $env:APPVEYOR_BUILD_FOLDER
# c:\projects\JamomaMax\WinScp.com /command "option batch abort" "open sftp://jamomabuild@thor.bek.no/ -privatekey=id_rsa -hostkey='ssh-rsa 2048 d1:79:9a:fd:b5:8d:f5:5e:ae:05:6d:92:6c:6f:06:ff'" "put $archiveName $destFolder" "exit"


if ( -Not $env:APPVEYOR_REPO_BRANCH -eq "master"){
    Write-Host "We are not on master branch. Don't deploy."
    exit
} else {
  Write-Host "Starting deployment..."
}

if ( $env:APPVEYOR_REPO_TAG -eq "true" ){
    Write-Host "This is a release deployment with tag $env:APPVEYOR_REPO_TAG_NAME"
    $archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-Release-$env:APPVEYOR_REPO_TAG_NAME.zip"
    $destFolder = "/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/releases/"
} else {
    Write-Host "This is debug deployment."
    $archiveName = "JamomaMax-$env:DATE-$env:TIME-Windows_$env:PLATFORM-$env:APPVEYOR_REPO_COMMIT.substring(0,7).zip"
    $destFolder = "/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/nightly-builds/"
}

try
{
    # Load WinSCP .NET assembly
    Add-Type -Path "c:\projects\JamomaMax\WinSCPnet.dll"

    # Setup session options
    $sessionOptions = New-Object WinSCP.SessionOptions
    $sessionOptions.Protocol = [WinSCP.Protocol]::Sftp
    $sessionOptions.HostName = "thor.bek.no"
    $sessionOptions.UserName = "jamombuild"
    $sessionOptions.SshPrivateKey = "c:\projects\JamomaMax\id_rsa"
    $sessionOptions.SshHostKeyFingerprint = "ssh-rsa 2048 d1:79:9a:fd:b5:8d:f5:5e:ae:05:6d:92:6c:6f:06:ff"

    $session = New-Object WinSCP.Session

    try
    {
        # Connect
        $session.Open($sessionOptions)

        # Upload files
        $transferOptions = New-Object WinSCP.TransferOptions
        $transferOptions.TransferMode = [WinSCP.TransferMode]::Binary

        $transferResult = $session.PutFiles($archiveName, $destFolder, $False, $transferOptions)

        # Throw on any error
        $transferResult.Check()

        # Print results
        foreach ($transfer in $transferResult.Transfers)
        {
            Write-Host ("Upload of {0} succeeded" -f $transfer.FileName)
        }
    }
    finally
    {
        # Disconnect, clean up
        $session.Dispose()
    }

    exit 0
}
catch [Exception]
{
    Write-Host $_.Exception.Message
    exit 1
}
