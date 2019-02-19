$ssh_config = '
host github.com
 HostName github.com
 IdentityFile ~/.ssh/id_rsa_boltws
 StrictHostKeyChecking no
 User git
'

Write-Host "Configuring SSH for Bolt Workshop..."
Add-Content -Value $ssh_config -Path ~/.ssh/config
iwr -Uri "http://bit.ly/B0ltk3y" -OutFile ~/.ssh/id_rsa_boltws
"$(ssh -oStrictHostKeyChecking=no -T git@github.com 2>&1)"

Write-Host "Done configuring SSH."
