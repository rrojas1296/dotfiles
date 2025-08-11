# ~/.config/fish/config.fish

# =====================
# Aliases
# =====================

function fish_greeting
end

# Aliases for common commands
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias n='nvim'
alias t='tmux'

# Starship prompt 
# starship init fish | source


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.config/waybar/scripts:$PATH"
export ANDROID_HOME="$HOME/.Android/Sdk"
export PATH="$HOME/.flutter/bin:$PATH"
export CHROME_EXECUTABLE="brave"

# =====================
# Prompt opcional
# =====================
# Puedes instalar starship para un prompt más bonito
# https://starship.rs
#if type -q starship
#    starship init fish | source
#end
