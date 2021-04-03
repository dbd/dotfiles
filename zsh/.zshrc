# Check to make sure that dotfiles are updated
git -C ~/.config/dotfiles status | grep "committed" >/dev/null && echo 'Commited the changed dotfiles!'
#Set identies to use for ssh-agent plugin
# Needed on mac because it doesn't autoload the ssh key
zstyle :omz:plugins:ssh-agent identities id_ed25519

#Spaceship prompt
# I don't need all the prompts so only show the following
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  golang        # Go section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  char          # Prompt character
  )
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_PROMPT_ADD_NEWLINE=false

ZSH_THEME="spaceship"

# Plugin and plugin config
plugins=(ssh-agent sudo docker)
cdpath=(. $HOME)

# OMZ init
export ZSH=$HOME/.oh-my-zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export FZF_DEFAULT_OPTS='--extended'
export GOPRIVATE=github.com
source ~/.fzf.zsh

#Export
#mac vim sucks
export EDITOR=nvim
alias vim="nvim"
export FZF_DEFAULT_COMMAND='rg --files --ignore-file .gitignore'

#Alias
alias vbm="VBoxManage"
alias g="git"
alias h="hub"
alias please="sudo !!"
alias c3="source $HOME/miniconda3/bin/activate"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/bin"

#Functions
function mkcd {
    mkdir $1 && cd $1
}

# Only init gcloud things when I need them, saves load time
function gcloud_init {
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/dbd/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dbd/Downloads/google-cloud-sdk/path.zsh.inc'; fi

    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/dbd/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dbd/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

}

# Only init nvm things when I need them, saves load time
function nvm_init {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function hsed {
    sed -e 's#\[#\\[#g' -e 's#\]#\\]#g' -e 's#{#\{#g' -e 's#}#\}#g' -e 's#\.#\\.#g'  -e 's#\,#\\,#g' $1
}

function mongocon {
    export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace llama mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode) 
    kubectl run --namespace llama mongodb-client --rm --tty -i --restart='Never' --image bitnami/mongodb --command -- mongo admin --host mongodb --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD
    unset MONGODB_ROOT_PASSWORD
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
