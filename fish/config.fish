set -g fish_greeting

set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_color_branch blue
set -g __fish_git_prompt_color_dirty red
set -g __fish_git_prompt_color_staged green
set -g __fish_git_prompt_color_upstream cyan

function fish_prompt
    set_color blue --bold
    echo -n " "

    set_color cyan
    echo -n (prompt_pwd) " "

    set_color blue
    __fish_git_prompt " %s "

    if type -q node
        set_color green --bold
        echo -n "⬢ "(node -v)" "
    end

    set_color blue --bold
    echo -n "❯ "

    set_color normal
end

function fish_right_prompt
    set_color brblack
    date "+%H:%M"
    set_color normal
end

alias n="nvim"
alias z="zellij"
alias ll="ls -la"

if status is-interactive
    and not set -q TMUX
    and test -z "$NVIM"
    fastfetch 
end

export PATH="$HOME/.config/waybar/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL="ghostty"
