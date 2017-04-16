if [ "$EUID" -ne 0 ]
  then echo "You should run this script as root. Exiting."
  exit
fi

echo "Installing Papirus Icon Theme..."
add-apt-repository ppa:varlesh-l/papirus-pack
apt update
apt install papirus-gtk-icon-theme

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb 
apt-get -f install

echo "Installing Skype..."
apt-get install skype

echo "Installing Git..."
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get install git

echo "Registering Git Aliases..."
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

echo "Installing gitk..."
apt-get install git-gui gitk

echo "Installing MySQL..."
apt-get install mysql-server
mysql_secure_installation
mysql_install_db

echo "Installing MySQL Workbench..."
wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-1ubuntu16.10-amd64.deb -O mysql-workbench-community.deb
dpkg -i mysql-workbench-community.deb
apt-get -f install

echo "Installing Notepadqq..."
add-apt-repository ppa:notepadqq-team/notepadqq
apt-get update
apt-get install notepadqq

echo "Installing Visual Studio Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install code

echo "Installing NodeJS..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs