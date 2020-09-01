# Set EDITOR
if [ -x "/snap/bin/nvim" ]; then
    EDITOR="nvim -u ~/.config/nvim/init.vim"; else
    EDITOR=vim
fi
# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1
