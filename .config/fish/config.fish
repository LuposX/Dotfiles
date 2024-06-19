export PATH="$HOME/.local/bin:$PATH"
export EDITOR=lvim
export VISUAL=lvim
export GPG_TTY=$(tty)
export JAVA_HOME=/usr

# Disables Fish greeting
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/lupos/.ghcup/bin $PATH # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/lupos/miniconda3/bin/conda
    eval /home/lupos/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/lupos/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/lupos/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/lupos/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# This is for backin up, dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# This is if you want to enable, zeliji by default 
#if set -q ZELLIJ
#else
#  zellij
#end

