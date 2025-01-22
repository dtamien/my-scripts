#!/bin/bash

install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing Zsh..."
        sudo apt update && sudo apt install -y zsh
        echo "Zsh installed successfully."
        chsh -s $(which zsh)
        echo "Zsh set as the default shell. Please restart the terminal."
    else
        echo "Zsh is already installed."
    fi
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
        echo "Oh My Zsh installed successfully."
    else
        echo "Oh My Zsh is already installed."
    fi
}

install_zsh_autosuggestions() {
    ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
    
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "Cloning zsh-autosuggestions plugin..."
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
        echo "zsh-autosuggestions successfully installed."
    else
        echo "zsh-autosuggestions is already installed."
    fi
}

update_zshrc() {
    if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
        echo "Adding zsh-autosuggestions to ~/.zshrc plugins..."
        sed -i '/^plugins=(/ s/)/ zsh-autosuggestions)/' ~/.zshrc
        echo "Plugin added to .zshrc successfully."
    else
        echo "zsh-autosuggestions is already enabled in .zshrc."
    fi
}

install_zsh
install_oh_my_zsh
install_zsh_autosuggestions
update_zshrc

echo "Installation completed. Please restart your terminal or run 'exec zsh' to apply changes."
