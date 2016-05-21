echo "installing ${1}"

sudo apt-key add ${1}/Repo.keys
sudo cp -R ${1}/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < ${1}/Package.list
sudo dselect

echo "install ${1} done"
