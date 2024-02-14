export ZDOTDIR="$HOME/.config/zsh"
source "$HOME/.cargo/env"
export HOMEBREW_OPT="/opt/homebrew/opt"
export JAVA_HOME="$HOMEBREW_OPT/openjdk/"
# export SPARK_HOME="$HOMEBREW_OPT/apache-spark/libexec"
export PATH="$JAVA_HOME:$SPARK_HOME:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export DAGSTER_HOME="$HOME/.dagster"
export GPG_TTY=$(tty)
export N_PRESERVE_NPM=1
export EDITOR="nvim"
