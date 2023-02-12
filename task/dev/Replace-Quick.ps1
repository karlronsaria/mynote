<#
.SYNOPSIS
howto: remove branch

.DESCRIPTION
Completely replace content of one branch with that of another.
#>

# $temp = cat res\setting.json | convertfrom-json | what TempPath
# create $temp if not exist
# create date folder in $temp if not exist
# $dst = "$temp\(date folder)\$repo"
# git clone "$env:GitProfile/$repo" $dst
# pushd $dst
# git checkout $dstBranch

Get-ChildItem "$src\*.*" -Recurse `
    | ? Name -ne ".git" `
    | Remove-Item

Get-ChildItem $src -Recurse `
    | ? Name -ne ".git" `
    | Remove-Item

Get-ChildItem "$src\*" -Recurse `
    | ? Name -ne ".git" `
    | Copy-Item -Destination $dst

# Push-Quick
# popd
# consider removing $dst
