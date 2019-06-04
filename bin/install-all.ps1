$failed = 0
foreach ($file in (Get-ChildItem .\bucket)) {
    if ($file.Extension -eq ".json") {
        $name = $file.FullName
        $baseName = $file.BaseName
        (scoop install $name 6> install_$baseName.log)
        if (Get-Content install_$baseName.log | findstr -i "ERROR") {
            Write-Error "Failed: $baseName"
            $failed = 1
        }
    }
}
exit $failed
