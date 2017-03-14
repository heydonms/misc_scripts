$DATE = Get-Date -UFormat "%Y%m%d_%H%M"

$PWSAPIKEY = "xxxxxxxxxxxxxxxxxxx"

$webclient = New-Object System.net.webclient
$webclient.DownloadFile("https://passwordstate.example.com/api/passwords/?apikey=$($PWSAPIKEY)&QueryAll&PreventAuditing=true", "PWSExport-$($DATE).json")

$PWS7ZKEY = "zzzzzzzzzzzzzzzzzzz"

scripts\7z.exe a "-p$($PWS7ZKEY)" PWSExport-$($DATE).7z PWSExport-$($DATE).json
rm PWSExport-$($DATE).json
