#!/bin/bash

# Exit on error
set -e

# ===== CONFIG =====
# List of packages to install
DEPENDENCIES=(
    neovim
    alacritty
    hyprpaper
    hyprland
    thunar
    rofi-wayland
    grim
    slurp
    mako
    sddm
    papirus-icon-theme
    ttf-nerd-fonts-symbols 
    ttf-intone-nerd 
    ttf-hack-nerd 
    adobe-source-han-sans-jp-fonts
    wl-clipboard
    ripgrep
    python-pynvim
    tmux
    base-devel
    htop
    gnome-keyring
    libsecret
)

# ===== INSTALLING PACKAGES WITH PARU =====
PARU_PACKAGES=(
    brave-bin
    visual-studio-code-bin
    neofetch
    android-studio
    spotify
)


# Directories to copy (relative or absolute paths)
FOLDERS_TO_COPY=(
    ./alacritty
    ./fish
    ./hypr
    ./mako
    ./rofi
    ./waybar
)

SCRIPTS_DIR="$HOME/.config/waybar/scripts"
ROFI_THEMES_REPO="https://github.com/newmanls/rofi-themes-collection"
NVIM_REPO="https://github.com/rrojas1296/nvim.git"

# Target config directory
CONFIG_DIR="$HOME/.config"

# ===== WELCOME BANNER =====
echo -e "\n\033[1;36m==============================================\033[0m"
echo -e "\033[1;32m   🚀 Welcome to the Arch Config Installer! 🚀\033[0m"
echo -e "\033[1;36m==============================================\033[0m"
echo -e "\033[1;33mThis script will install dependencies, copy your\033[0m"
echo -e "\033[1;33mconfigs, and set up Neovim & Rofi themes for you.\033[0m"
echo -e "\033[1;36m----------------------------------------------\033[0m"

# ===== INSTALL PACKAGES =====
echo -e "\n\033[1;36m[*] Installing packages...\033[0m"
sudo pacman -Syu --needed --noconfirm "${DEPENDENCIES[@]}"

# ===== INSTALLING PARU =====
echo -e "\n\033[1;36m[*] Installing paru AUR helper...\033[0m"
if command -v paru >/dev/null 2>&1; then
    echo -e "\033[1;33m  paru is already installed, skipping.\033[0m"
else
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/paru
    echo -e "\033[1;32m  paru installed successfully!\033[0m"
fi


echo -e "\n\033[1;36m[*] Installing packages with paru...\033[0m"
if ! command -v paru >/dev/null 2>&1; then
    echo -e "\033[1;31m  paru is not installed. Please install it first.\033[0m"
else
    paru -S --needed --noconfirm "${PARU_PACKAGES[@]}"
    echo -e "\033[1;32m  AUR packages installed successfully!\033[0m"
fi


# ===== COPY CONFIG FOLDERS =====
echo -e "\n\033[1;36m[*] Copying folder into config folder...\033[0m"
mkdir -p "$CONFIG_DIR"

for folder in "${FOLDERS_TO_COPY[@]}"; do
  if [ -d "$folder" ]; then
    echo "  -> Copying $folder to $CONFIG_DIR"
    cp -r "$folder" "$CONFIG_DIR/"
  else
    echo "  !! Skipping $folder (does not exist)"
  fi
done


# ===== SETTING EXECUTABLE PERMISSIONS =====
echo -e "\n\033[1;36m[*] Setting executable permissions...\033[0m"
for file in "$SCRIPTS_DIR"/*.sh ; do
  if [ -f "$file" ]; then
    chmod +x "$file"
    echo -e "\033[1;33m  -> Executable permision setted to $file.\033[0m"
  fi
done

# ===== INSTALLING FISHER AND NVM =====
echo -e "\n\033[1;36m[*] Installing Fisher...\033[0m"
if ! fish -c "functions fisher" >/dev/null 2>&1; then
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
    | source && fisher install jorgebucaran/fisher
else
  echo -e "\033[1;33m  Fisher is already installed, skipping.\033[0m"
fi

echo -e "\n\033[1;36m[*] Installing NVM plugin for Fish...\033[0m"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install catppuccin/fish"
fish -c "fish_config theme save 'Catppuccin Mocha'"
fish -c "nvm install lts"


# ===== INSTALLING TPM FOR TMUX =====
echo -e "\n\033[1;36m[*] Installing TPM for Tmux...\033[0m"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  cp ./.tmux.conf "$HOME/"
else
  echo -e "\033[1;33m  TPM already installed, skipping.\033[0m"
fi

# ===== CLONE NVIM CONFIG =====
#
echo -e "\n\033[1;36m[*] Cloning nvim...\033[0m"

if [ -d "$CONFIG_DIR/nvim" ]; then
  echo -e "\033[1;33m  !! Nvim already exist, skipping clone.\033[0m"
else
  git clone "$NVIM_REPO" "$CONFIG_DIR/nvim"
fi


# ===== ROFI THEME INSTALATION ====
echo -e "\n\033[1;36m[*] Cloning rofi themes...\033[0m"
if [ -d "$CONFIG_DIR/rofi" ] && [ -d "$HOME/rofi-themes" ]; then
  echo -e "\033[1;33m  !! $CONFIG_DIR/rofi and $HOME/rofi-themes already exists, skipping clone.\033[0m"
else
  git clone "$ROFI_THEMES_REPO" "$HOME/rofi-themes"
  
  # Crear carpetas necesarias
  mkdir -p "$HOME/.local/share/rofi/themes"
  mkdir -p "$CONFIG_DIR/rofi"
    
  cp "$HOME/rofi-themes/themes/rounded-blue-dark.rasi" "$HOME/.local/share/rofi/themes/"
  cp -r "$HOME/rofi-themes/themes/template" "$HOME/.local/share/rofi/themes/"
fi


echo -e "\n\n[✓] Done!"
