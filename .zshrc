# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# (wal -r -t &)
# (wal -R -q --vte)


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/ryan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Powerline install:
# https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi      

# Virtualenvwrapper (for python/django)
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper_lazy.sh

# fzf: Fuzzy Finding tool
#
# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add alias for opening result in vim
# Checks if an actual match was found before launching vim
# Outputs file name to stdout for easy copying in later actions
alias vf='LAST_FILE="$(fzf)" && [[ -n $LAST_FILE ]] && echo $LAST_FILE && vim $LAST_FILE'

# My aliases
alias v='vim'
alias c='clear'
alias agi='sudo apt-get install'
alias untar='tar -xsvf'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias music='ncmpcpp'
alias open='xdg-open'
alias of='xdg-open "$(fzf)"'  # Use fzf and xdg-open to find and open anything
alias diff='colordiff'

alias pytohn=python
alias pytohn3=python3

alias checkin='runghc /home/ryan/git/check-script/check.hs' # Print the checkins or give an argument to record

# For todo.sh
# alias t="~/Dropbox/todo/todo.sh -d ~/Dropbox/todo/todo.cfg" 
# alias tv="vim ~/Dropbox/todo/todo.txt"
# alias todo="~/Dropbox/todo/todo.sh -d ~/Dropbox/todo/todo.cfg" 
# PATH=$PATH:"/path/to/your/todo/scripts"
# complete -F _todo t


# Make config a command for dotfiles on a git repo
alias config='/usr/bin/git --git-dir=/home/ryan/.cfg/ --work-tree=/home/ryan'
# alias attu="ssh rgrose@attu.cs.washington.edu"

# Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pywal
export PATH="${PATH}:${HOME}/.local/bin/"

# Add cabal to path
export PATH=$PATH:"/home/ryan/.cabal/bin"

# Mobile Development
## Android Studio/Flutter
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH=$PATH:$ANDROID_HOME/platform-tool
alias androidstudio=/opt/android-studio/bin/studio.sh
export PATH=$PATH:"/home/ryan/curie/.development/flutter/bin"
source /etc/profile.d/gradle.sh

# Source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# MSSQL
export PATH="$PATH:/opt/mssql-tools/bin"

# FZF TODO
# df(dir_name) = dir_name/$(ls dir_name | fzf)
alias dnd='cd ~/Documents/dnd'
