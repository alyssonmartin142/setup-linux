# !/bin/bash
sudo apt update
sudo apt install -y apt-transport-https software-properties-common vim

echo "Instalar Brave"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

echo "Instalar tilix"
sudo apt install -y tilix

echo "Mudar terminal padrão"
sudo update-alternatives --config x-terminal-emulator

echo "Instalação do docker e pacotes necessários"
curl -fsSL https://get.docker.com | bash
sudo usermod -aG docker $USER

echo "Instalação do docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl start docker

echo "Instalação do kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Instalação terraform"
sudo curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install -y terraform

echo "Instalação Ansible"
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

echo "Instalação Node.js"
sudo curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install --global yarn

echo "Instalação Google Chrome"
sudo apt-get install -y google-chrome-stable

echo "Instalação opera"
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo apt install -y opera-stable

echo "Instalação virtualbox"
sudo apt-get install -y virtualbox

echo "Instalação vscode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code-insiders

# Criar diretorios
# mkdir -p ~/Documentos/projects/integrado
# mkdir -p ~/Documentos/projects/labs

echo "Instalação aws cli 2"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -f awscliv2.zip
rm -rf aws

echo "Add flatpakrepo"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

echo "Instalar onlyoffice"
flatpak install flathub org.onlyoffice.desktopeditors -y

echo "Instalar GitKraken"
flatpak install flathub com.axosoft.GitKraken -y

echo "Instalação discord"
flatpak install flathub com.discordapp.Discord -y

echo "Instalação Remmina"
flatpak install flathub org.remmina.Remmina -y

echo "Instalação Simplenote"
flatpak install flathub com.simplenote.Simplenote -y

echo "Instalação Postman"
flatpak install flathub com.getpostman.Postman -y

echo "Instalação Insomnia"
flatpak install flathub rest.insomnia.Insomnia -y

echo "Instalação dos jetbrains"
flatpak install flathub com.jetbrains.PhpStorm -y
flatpak install flathub com.jetbrains.DataGrip -y

echo "Instalação Zoom"
flatpak install flathub us.zoom.Zoom -y

echo "Instalação Telegram"
flatpak install flathub org.telegram.desktop -y

echo "Instalação Flameshot"
flatpak install flathub org.flameshot.Flameshot -y

echo "Instalação Bitwarden"
flatpak install flathub com.bitwarden.desktop -y
# Permissão known
# chown -v $USER ~/.ssh/known_hosts
