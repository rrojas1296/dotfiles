set -g fish_greeting

# ----------------
# Git prompt setup
# ----------------
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_color_branch blue
set -g __fish_git_prompt_color_dirty red
set -g __fish_git_prompt_color_staged green
set -g __fish_git_prompt_color_upstream cyan

# ----------------
# Custom Fish Prompt
# ----------------
function fish_prompt
    # Arch Linux logo
    set_color blue --bold
    echo -n " "

    # Current directory
    set_color cyan
    echo -n (prompt_pwd) " "

    # Git repository status
    set_color blue
    __fish_git_prompt " %s "

    # Node.js version (GREEN)
    if type -q node
        set_color green --bold
        echo -n "⬢ "(node -v)" "
    end

    # Prompt symbol
    set_color blue --bold
    echo -n "❯ "

    set_color normal
end

# ----------------
# Right prompt (optional)
# ----------------
function fish_right_prompt
    set_color brblack
    date "+%H:%M"
    set_color normal
end

alias n="nvim"
alias z="zellij"
alias ll="ls -la"

if status is-interactive
    and not set -q TMUX  # opcional, si no quieres en tmux
    and test -z "$NVIM"  # opcional, para no mostrar en neovim
    pfetch
end

export PATH="$HOME/.config/waybar/scripts:$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Gnome keyring
set -x GTK_USE_PORTAL 1
set -x XDG_CURRENT_DESKTOP Hyprland

# SSH fish
set -x SSH_AUTH_SOCK /home/oasis/.ssh/agent/s.CCLzgJ7Cmn.agent.c1zMjZT2Jg
