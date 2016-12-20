cls
Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
$list = (get-spsite https://lms.comparatio.org).RootWeb.Lists["News"]

#$list.Items[0].ContentType.Name #| %{$_.ContentType.Name}

$folders = $list.Folders | ?{$_.Level -eq 'Draft'}
#$folders = $list.Folders


foreach ($folder in $folders)
{


    $folder["_ModerationStatus"] = 0
    $folder.Update()
}
