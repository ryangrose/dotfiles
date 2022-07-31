#############################
#          _                #
#  _______| |__  _ __ ___   #
# |_  / __| '_ \| '__/ __|  #
#  / /\__ | | | | | | (__   #
# /___|___|_| |_|_|  \___|  #
#                           #
#############################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh-installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of zsh theme to load
# See https://github.com/robbyrussel/oh-my-zsh/wiki/Themes
export ZSH_THEME="powerlevel10k/powerlevel10k"
# export plugins=(poetry zsh-autosuggestions zsh-z zsh-syntax-highlighting)
export plugins=(poetry zsh-autosuggestions zsh-syntax-highlighting zsh-z)
source "$ZSH/oh-my-zsh.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Disable terminal noises
unsetopt BEEP
set bell-style none

#
# fzf: fuzzy finding tool
#

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"


#
# awscli autocomplete
#
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html#cli-command-completion-linux
complete -C $(which aws_completer) aws



# Git autocomplete
if [[ ! -f ~/.zsh/git-completion.zsh ]]
then
    # Download the scripts
    mkdir -p ~/.zsh
    curl -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
    curl -o ~/.zsh/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi
zstyle ':completion:*:git:*' script ~/.zsh/git-completion.zsh
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

#
# my stuff
#

# Source other scripts, like aliases
source ~/.zsh/aliases

# change find: cd to a fzf directory
cf() {
    _VAR=$(fzf)
    cd "$(dirname _VAR)"
}

vf() {
    LAST_FILE="$(fzf)"
    [[ -n $LAST_FILE ]] && echo "$LAST_FILE" && vim "$LAST_FILE"
}
# open last result in vim
alias lf='vim $LAST_FILE'

# git find add: find modified files in fzf, git add
gfa() {
    _files_to_add="$(git status --short | awk '{ print $2 }' | fzf --multi )"
    [[ -n $_files_to_add ]] && echo "git add $_files_to_add" && git add $_files_to_add
}

s3ls() {
    aws s3 ls $1 | awk '{ if($NF == "") print $(NF - 1); else $NF }'
}

# recursively fzf in s3 bucket, print s3 url
fs3() {
    if [[ -n $1 ]]
    then
        RESULT=$1
    else
        RESULT="s3://$(fzf < ~/.config/buckets.txt)"
    fi
    FOUND_PATH=$RESULT
    while [[ -n "$RESULT" ]]
    do
        RESULT=$(s3ls $FOUND_PATH | fzf)
        FOUND_PATH="$FOUND_PATH$RESULT"
        if [[ $RESULT != */ ]]
        then
            RESULT=""
        fi
    done
    echo $FOUND_PATH
}

# find and download a file in s3
ds3() {
    if [[ -n $1 ]]
    then
        s3path=$1
    else
        s3path=$(fs3)
    fi
    aws s3 cp $s3path .
}

# switch between aws profiles found in ~/.aws/credentials
switch_aws_profile() {
    if [[ -n $1 ]]
    then
        export AWS_PROFILE=$1
    else
        export AWS_PROFILE=$(grep '\[.*\]' < ~/.aws/credentials | sed 's/\[\(.*\)\]/\1/g' | fzf )
    fi
    echo $AWS_PROFILE
    aws sts get-caller-identity
}
