# !/bin/bash
# Documentação usada https://onebitcode.com/terminal-hiper-produtivo-zsh/
echo "Instalação ZSH"
sudo apt update
sudo apt-get install zsh -y
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh	
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
nano ~/.zshrc
# include in pluggins
# plugins=(
#   zsh-syntax-highlighting
#   ...
# )

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
nano ~/.zshrc
# include in pluggins
# plugins=(
#   fzf
#   ...
# )

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
nano ~/.zshrc
# include in pluggins
# plugins=(
#   zsh-autosuggestions
#   ...
# )

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
nano ~/.zshrc
# include in pluggins
# plugins=(
#   k
#   ...
# )

# pluggins final
# plugins=(
#  zsh-syntax-highlighting
#  fzf
#  zsh-autosuggestions
#  k
#  git
#  kubectl
#  terraform
#  git-flow
#  npm
#  yarn
#  node
#  aws
# )

mkdir ~/.fonts
wget -P ~/.fonts 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/BitstreamVeraSansMono.zip'
unzip ~/.fonts/BitstreamVeraSansMono.zip -d ~/.fonts

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
nano ~/.zshrc
# ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL10K_MODE="nerdfont-complete"
p10k configure

# y y y y
# Prompt Style -> 3
# Character Set -> 1
# Prompt Color -> 3
# Show current time? -> 2
# Prompt Separators -> 1
# Prompt Heads -> 1
# Prompt Tails -> 1 ou 2 caso style for 2
# Prompt Height -> 2
# Prompt Connection -> 2
# Connection & Frame Color -> 4
# Prompt Frame -> 2
# Prompt Spacing -> 2
# Icons -> 2
# Prompt Flow -> 2
# Enable Transient Prompt? -> y

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
terraform -install-autocomplete
