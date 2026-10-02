if status is-interactive
    # Commands to run in interactive sessions can go here
end

fastfetch

set -U fish_greeting

export PATH="$PATH:/home/oasis/.local/bin"
export PATH="$PATH:/home/oasis/.config/waybar/scripts"

oh-my-posh init fish --config ~/.oh-my-posh/themes/amro.omp.json | source

alias n="nvim"
alias ll="ls -la"
alias hr="herdr"
alias ld="lazydocker"

# pnpm
set -gx PNPM_HOME '/home/oasis/.local/share/pnpm'
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end
