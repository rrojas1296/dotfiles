# ~/.config/fish/config.fish

# =====================
# Aliases
# =====================


function fish_prompt --description 'Arch icon | Folder | Git | Node version'
    # Colors
    set -l COLOR_ICON cyan
    set -l COLOR_NODE green
    set -l COLOR_CWD magenta
    set -l COLOR_GIT_BRANCH blue
    set -l COLOR_GIT_DIRTY red
    set -l COLOR_RESET (set_color normal)

    # Arch icon
    set -l ARCH_ICON "󰣇"

    # Current folder only
    set -l cwd_segment (set_color $COLOR_CWD)(basename (pwd))(set_color normal)

    # Git branch + dirty state
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
        set -l git_dirty ""
        if not git diff --quiet --ignore-submodules -- 2>/dev/null
            set git_dirty "*"
        end
        if test -n "$git_dirty"
            set git_segment (set_color $COLOR_GIT_DIRTY)" $git_branch$git_dirty"(set_color normal)
        else
            set git_segment (set_color $COLOR_GIT_BRANCH)" $git_branch"(set_color normal)
        end
    else
        set git_segment ""
    end

    # Node.js version
    set -l node_segment ""
    set -l node_ver (node -v ^/dev/null)
    if test $status -eq 0 -a -n "$node_ver"
        set node_ver (string replace -r '^v' '' $node_ver)
        set node_segment (set_color $COLOR_NODE)"node:$node_ver"(set_color normal)
    end

    # Build prompt in desired order
    printf "%s " (set_color $COLOR_ICON)$ARCH_ICON(set_color normal)
    printf "%s " $cwd_segment
    if test -n "$git_segment"
        printf "%s " $git_segment
    end
    if test -n "$node_segment"
        printf "%s " $node_segment
    end

    printf "\n%s> %s" (set_color $COLOR_ICON) $COLOR_RESET
end


# Aliases for common commands
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gpu='git push'
alias n='nvim'
alias hx='helix'
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

if status is-interactive
    and not set -q TMUX  # opcional, si no quieres en tmux
    and test -z "$NVIM"  # opcional, para no mostrar en neovim
    pfetch
end

function fish_greeting
end


# opencode
fish_add_path /home/oasis/.opencode/bin
