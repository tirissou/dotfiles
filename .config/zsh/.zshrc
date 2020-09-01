module_path+=( "/home/tibo/.config/zsh/zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin


HISTFILE=$ZDOTDIR/history
HISTSIZE=10000
SAVEHIST=10000
# VIM BABY
bindkey -v

source $ZDOTDIR/alias.zsh
source $ZDOTDIR/shortcuts.zsh

setopt incappendhistory autocd extendedglob
source $ZDOTDIR/zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Git
zinit snippet OMZ::plugins/git/git.plugin.zsh
# Docker
zinit ice svn
zinit snippet PZT::modules/docker 
# Python
# zinit ice svn silent wait"!0"
# zinit snippet PZT::modules/python
# zstyle ':prezto:module:python' skip-virtualenvwrapper-init 'on'
# zstyle ':prezto:module:python' conda-init 'on'
zinit ice pick"async.zsh" src"pure.zsh"
zinit ice svn silent wait"!0"
zinit light sindresorhus/pure
# Autosuggestions
zinit load zsh-users/zsh-autosuggestions 
# Completions
zinit ice lucid wait"!0"
zinit load zsh-users/zsh-completions
# FZF
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
# zinit pack for fzf
zinit ice pick'shell/completion.zsh' src'shell/key-bindings.zsh'
zinit load junegunn/fzf
# source $ZDOTDIR/fzf/bindings.zsh
# source $ZDOTDIR/fzf/completion.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tibo/.config/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tibo/.config/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tibo/.config/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tibo/.config/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load completions
autoload -U compinit && compinit
# Syntax highlighting
zinit ice lucid wait"!0"
zinit load zsh-users/zsh-syntax-highlighting
