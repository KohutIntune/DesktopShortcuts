<#
Version: 1.0
Author: Jannik Reinhard (jannikreinhard.com)
Script: Create-ShortcutFile
Description:
Create the Lnk shortcut file
Release notes:
Version 1.0: Init
Version 1.1: Copy icon local
#> 


function Create-WebShortcut {
    param (
        [Parameter(Mandatory)]
        [String] $Path,
        [Parameter()]
        [String] $WebsiteUrl,
        [Parameter()]
        [String] $Icon
    )

    #Edge
    $edgePath = "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"


    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($Path)
    $Shortcut.TargetPath = $edgePath
    $Shortcut.Arguments = $WebsiteUrl
    $Shortcut.IconLocation = $Icon
    $Shortcut.Save()
    [Runtime.InteropServices.Marshal]::ReleaseComObject($WshShell) | Out-Null
}

#Name of the shortcut
$shortcutName = "Ign Test Shortcut" 
#Icon file best to use a website
$iconPath = "$PSScriptRoot\IGN.ico"
#Link of the webseite
$websiteUrl = "https://ign.com"
#OutputFolder
$outputFolder = "$Env:Public\Desktop"



$path = Join-Path -Path $outputFolder -ChildPath "$shortcutName.lnk"

#Create shortcut

Create-WebShortcut -Path $path -WebsiteUrl $websiteUrl -Icon $iconPath


