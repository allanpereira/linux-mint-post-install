if [ "$EUID" -ne 0 ]
  then echo "You should run this script as root. Exiting."
  exit
fi

echo "Installing ArcKDE Theme..."
add-apt-repository ppa:papirus/arc-kde
apt-get update
apt-get -y install arc-kde kvantum

echo "Installing Papirus Icon Theme..."
add-apt-repository ppa:varlesh-l/papirus-pack
apt-get update
apt-get -y install papirus-gtk-icon-theme

echo "Installing Inconsolata Font..."
apt-get -y install fonts-inconsolata

echo "Installing Roboto Font..."
apt-get -y install fonts-roboto

echo "Installing Source Code Pro Font..."
FONT_NAME="SourceCodePro"
mkdir /tmp/$FONT_NAME
cd /tmp/$FONT_NAME
wget "https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz" -O "`echo $FONT_NAME`.tar.gz"
tar --extract --gzip --file ${FONT_NAME}.tar.gz
mkdir /usr/share/fonts/truetype/$FONT_NAME
cp -rf /tmp/$FONT_NAME/. /usr/share/fonts/truetype/$FONT_NAME/.

echo "Updating font cache..."
fc-cache -fv

echo "Installing Guake..."
apt-get -y install guake

echo "Installing Spotify..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get -y install spotify-client

echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb 
apt-get -y -f install

echo "Installing Git..."
add-apt-repository ppa:git-core/ppa
apt-get update
apt-get -y install git

echo "Registering Git Aliases..."
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

echo "Installing gitk..."
apt-get -y install git-gui gitk

echo "Installing MySQL..."
apt-get -y install mysql-server
mysql_secure_installation
mysql_install_db

echo "Installing MySQL Workbench..."
wget http://cdn.mysql.com/Downloads/MySQLGUITools/mysql-workbench-community-6.3.9-1ubuntu16.10-amd64.deb -O mysql-workbench-community.deb
dpkg -i mysql-workbench-community.deb
apt-get -y -f install

echo "Installing Notepadqq..."
add-apt-repository ppa:notepadqq-team/notepadqq
apt-get -y update
apt-get -y install notepadqq

echo "Installing Visual Studio Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get -y install code

echo "Installing NodeJS..."
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get -y install nodejs

read -p "Install Skype. Press any key to continue..."

read -p "Go to Google Chrome and install Postman. Press any key to continue..."
read -p "Go to Google Chrome and install Card Color Titles for Trello. Press any key to continue..."

read -p "Set Papirus as Icon Theme. Press any key to continue..."
read -p "Set Arc Dark as Desktop Theme. Press any key to continue..."
read -p "Set Breeze Snow as Cursor Theme. Press any key to continue..."

read -p "Add Guake to Startup Applications (System Settings -> Startup and Shutdown -> Add Program...). Press any key to continue..."
read -p "Change mouse action for double-click. Press any key to continue..."