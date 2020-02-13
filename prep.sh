echo "Retrieving SSH Key for Bolt Workshop..."

if [ ! -d ~/.ssh ]
then
  mkdir ~/.ssh
fi

curl "https://raw.githubusercontent.com/tspeigner/workshop-control-repo/production/workshop_key.enc" -L -o ~/workshop_key.enc
rm -rf ~/.ssh/id_rsa_boltws
base64 --decode ~/workshop_key.enc > ~/.ssh/id_rsa_boltws
chmod 0600 ~/.ssh/id_rsa_boltws
chmod 0600 ~/.ssh/config
ssh -oStrictHostKeyChecking=no -T -i ~/.ssh/id_rsa_boltws git@github.com

echo "Done retrieving SSH Key."

cd ~
echo "Cloning Workshop Control Repo via HTTPS to $(pwd)/workshop-control-repo..."
if [ -d ~/workshop-control-repo ]
then
  rm -rf ~/workshop-control-repo
fi
git clone -q https://www.github.com/tspeigner/workshop-control-repo.git

echo "Reconfiguring Workshop Control Repo to sync via SSH..."
cd workshop-control-repo
git remote remove origin
git remote add origin git@github.com:tspeigner/workshop-control-repo
git config core.sshCommand "ssh -i ~/.ssh/id_rsa_boltws -F /dev/null"
git push -u origin production
cd ..

echo "Done!"
