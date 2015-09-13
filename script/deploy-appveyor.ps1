# c:\projects\JamomaMax\WinScp.com /command "option batch abort" "open sftp://jamomabuild@thor.bek.no/ -privatekey=id_rsa -hostkey='ssh-rsa 2048 d1:79:9a:fd:b5:8d:f5:5e:ae:05:6d:92:6c:6f:06:ff'" "put $archiveName $destFolder" "exit"


if ( -Not $env:APPVEYOR_REPO_BRANCH -eq "master"){
    Write-Host "We are not on master branch. Don't deploy."
    exit
} else {
  Write-Host "Starting deployment..."
}

if ( $env:APPVEYOR_REPO_TAG -eq "true" ){
    Write-Host "This is a release deployment with tag $env:APPVEYOR_REPO_TAG_NAME"
    $destFolder = "/Volumes/ThorData/WebServer/Jamoma/nanoc-website/output/download/JamomaMax/releases/"
} else {
    Write-Host "This is debug deployment."
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
    $sessionOptions.SshPrivateKeyPath = "c:\projects\JamomaMax\id_rsa"
    $sessionOptions.SshHostKeyFingerprint = "ssh-rsa 2048 d1:79:9a:fd:b5:8d:f5:5e:ae:05:6d:92:6c:6f:06:ff"

    $session = New-Object WinSCP.Session
    $session.DebugLogPath = "c:\projects\JamomaMax\WinSCP-Debug.log"
    $session.SessionLogPath = "c:\projects\JamomaMax\WinSCP-Session.log"

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
