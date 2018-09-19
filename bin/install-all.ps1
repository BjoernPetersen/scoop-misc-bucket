$failed = 0
foreach ($file in Get-ChildItem) {
    if ($file.Extension -eq ".json") {
        $name = $file.Name
        (scoop install $name 6> install_$name.log)
        if (Get-Content install_$name.log | findstr -i "ERROR") {
            $failed = 1
        } else {
            Remove-Item install_$name.log
        }
    }
}
exit $failed
