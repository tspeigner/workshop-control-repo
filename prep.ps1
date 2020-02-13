Write-Host "Retrieving SSH Key for Bolt Workshop..."
New-Item -ItemType Directory -Force -Path ~/.ssh
iwr -Uri "https://raw.githubusercontent.com/tspeigner/workshop-control-repo/production/workshop_key.enc" -OutFile ~/workshop_key.enc
$content = Get-Content ~/workshop_key.enc
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($content)) | Out-File -Encoding "ASCII" ~/.ssh/id_rsa_boltws
"$(& $Env:Programfiles\Git\usr\bin\ssh.exe -oStrictHostKeyChecking=no -T -i ~/.ssh/id_rsa_boltws git@github.com 2>&1)"

Write-Host "Done retrieving SSH Key."

cd ~
Write-Host "Cloning Workshop Control Repo via HTTPS to $((Get-Location).Path)\workshop-control-repo ..."
If (Test-Path "$((Get-Location).Path)\workshop-control-repo") {
  Remove-Item -Path "$((Get-Location).Path)\workshop-control-repo" -Recurse -Force 
}
git clone -q https://www.github.com/tspeigner/workshop-control-repo.git

echo "Reconfiguring Workshop Control Repo to sync via SSH..."
cd workshop-control-repo
"$(& git remote remove origin 2>&1)"
"$(& git remote add origin git@github.com:tspeigner/workshop-control-repo 2>&1)"
"$(& git config core.sshCommand "ssh -i ~/.ssh/id_rsa_boltws -F /dev/null" 2>&1)"
"$(& git push -u origin production 2>&1)"
cd ..

Write-Host "Done!"
