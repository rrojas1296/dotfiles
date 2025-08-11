# Arch Config Installer

This Bash script automates the setup of an Arch Linux environment with:

- **System packages** via `pacman`
- **AUR packages** via `paru`
- **Configuration files** for your apps
- **Fish shell setup** with Fisher, NVM, and Catppuccin theme
- **Tmux Plugin Manager (TPM)**
- **Neovim** configuration
- **Rofi** themes

---

## 📦 Packages Installed

### Official Repositories (`pacman`)

- neovim
- alacritty
- hyprpaper
- hyprland
- thunar
- rofi-wayland
- grim
- slurp
- mako
- sddm
- papirus-icon-theme
- ttf-nerd-fonts-symbols
- ttf-intone-nerd
- ttf-hack-nerd
- adobe-source-han-sans-jp-fonts
- wl-clipboard
- ripgrep
- python-pynvim
- tmux
- base-devel

### AUR Packages (`paru`)

- brave-bin
- visual-studio-code-bin
- neofetch
- android-studio

---

## 📂 Config Folders Copied

The script copies the following local folders into `~/.config`:

- `alacritty`
- `fish`
- `hypr`
- `mako`
- `rofi`
- `waybar`

---

## 🔹 Extra Installations

- **Fisher** + `nvm.fish` + `catppuccin/fish`
- **TPM** for Tmux
- **Neovim config** from `https://github.com/rrojas1296/nvim.git`
- **Rofi themes** from `https://github.com/newmanls/rofi-themes-collection`

---

## 🚀 Usage

1. Clone this repository or download the script:

   ```bash
    git clone https://github.com/YOUR_USERNAME/arch-config-installer.git
    cd arch-config-installer
   ```

   ```bash
    chmod +x install.sh
   ```

   ```bash
    ./install.sh
   ```
