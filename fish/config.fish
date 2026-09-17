set -g fish_greeting

oh-my-posh --config '~/.cache/oh-my-posh/themes/robbyrussell.omp.json' init fish | source

alias n="nvim"
alias z="zellij"
alias ll="ls -la"
alias t="tmux"
alias lg="lazygit"
alias ld="lazydocker"
alias hr="herdr"

if status is-interactive
    and not set -q TMUX
    and test -z "$NVIM"
    fastfetch 
end

export PATH="$HOME/.config/waybar/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL="ghostty"
export EDITOR="nvim"
