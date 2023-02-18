# command
## tag
@powershell, @git, @PsProfile

## what
```powershell
cd \note
Push-Quick
git checkout mobile
git pull origin mobile
git checkout laptop
git diff mobile
sudo nvim .\pool_-_2023_01_26.md
Push-Quick
Invoke-GitReplaceBranchContent -Branch mobile -NoConfirm
Push-Quick
git checkout laptop
git diff mobile
Merge-Quick
```
