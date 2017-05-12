Add-PSSnapin Microsoft.SharePoint.PowerShell
cls
Write-Host "Start:" (Get-Date)
$list = (get-spweb http://hamburg/).Lists["Meine Liste"]
$auswahl = "Eins", "Zwei", "Drei"

for ($i = 1; $i -le 30; $i++)
{
    $newItem = $list.Items.Add()
    $newItem["Title"] = '{0} {1} erstellt {2}' -f "Element",$i,(Get-Date)
    $newItem["Auswahl"] = $auswahl[(Get-Random -Maximum 3)]
    $newItem.Update()
    Write-Host "Item wurde erstellt"
}
Write-Host "Ende:" (Get-Date)
