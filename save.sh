dpkg --get-selections > ./${1}/Package.list
sudo cp -R /etc/apt/sources.list* ./${1}
sudo apt-key exportall > ./${1}/Repo.keys

