echo "Configuring SSH for Bolt Workshop..."
cat << EOF >> ~/.ssh/config
host github.com
 HostName github.com
 IdentityFile ~/.ssh/id_rsa_boltws
 StrictHostKeyChecking no
 User git
EOF

curl "http://bit.ly/B0ltk3y" -L -o ~/.ssh/id_rsa_boltws
ssh -oStrictHostKeyChecking=no -T git@github.com

echo "Done configuring SSH."
