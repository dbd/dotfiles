# Check to make sure that dotfiles are updated
git -C ~/.config/dotfiles status | grep "committed" >/dev/null && echo 'Commited the changed dotfiles!'
#Set identies to use for ssh-agent plugin
# Needed on mac because it doesn't autoload the ssh key
zstyle :omz:plugins:ssh-agent identities id_ed25519

os=$(uname)
if [[ "$os" == "Darwin" ]]; then
    source ~/.fzf.zsh
else
    source <(fzf --zsh)
fi


#Spaceship prompt
# I don't need all the prompts so only show the following
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  golang        # Go section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  exec_time     # Execution time
  char          # Prompt character
  )
export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_PROMPT_ADD_NEWLINE=false

ZSH_THEME="eastwood"

# Plugin and plugin config
plugins=(ssh-agent sudo docker asdf)
# install asdf with `git clone https://github.com/asdf-vm/asdf.git ~/.asdf`
cdpath=(. $HOME)

# OMZ init
export ZSH=$HOME/.oh-my-zsh
export XDG_CONFIG_HOME=$HOME/.config
source $HOME/.oh-my-zsh/oh-my-zsh.sh
export FZF_DEFAULT_OPTS='--extended'
export GOPRIVATE=github.com

# For mac uncomment the below and comment the /usr/share


#Export
#mac vim sucks
export EDITOR=nvim
alias vim="nvim"
export FZF_DEFAULT_COMMAND='rg --files --ignore-file .gitignore'

export PATH=$HOME/bin:$PATH:/usr/local/go/bin:$HOME/gems/bin:$HOME/.krew/bin:$HOME/.local/bin

#Alias
alias vbm="VBoxManage"
alias g="git"
alias h="hub"
alias please="sudo !!"
alias c3="source $HOME/miniconda3/bin/activate"
alias kc="kubectl"
alias clear_dns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/bin"

export CHARM_HOST=charm.dbd.sh
export CHARM_SERVER_HTTP_SCHEME=https

#Functions
function mkcd {
    mkdir $1 && cd $1
}

# Only init gcloud things when I need them, saves load time
function gcloud_init {
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

    # The next line enables shell command completion for gcloud.
    if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

}

# Only init nvm things when I need them, saves load time
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function hsed {
    sed -e 's#\[#\\[#g' -e 's#\]#\\]#g' -e 's#{#\{#g' -e 's#}#\}#g' -e 's#\.#\\.#g'  -e 's#\,#\\,#g' $1
}

export GEM_HOME="$HOME/gems"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

setopt nosharehistory
setopt noincappendhistory

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

alias gfp="git push origin \`git branch --show-current\` -f"

function gdiff {
    branch=`git branch --show-current`
    nvim "+Git difftool -y master...$branch"
}

# pnpm
export PNPM_HOME="/home/dbd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
