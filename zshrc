# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew tmux tmuxinator aws docker docker-compose terraform nomad vault golang shrink-path kubectl)

# User configuration

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

export PATH="$HOME/workspace/bin:$HOME/workspace/personal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="/opt/homebrew/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh
# Disable sharing history between tabs
unsetopt inc_append_history
unsetopt share_history


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh_aliases
# The same as cat but with colored output, requires python library pygmentize

# Set default user to hide the user@hostname when running on zsh on the workstation
DEFAULT_USER=r2d2

# LS colors for solarized dark
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

###########
# HISTORY #
###########
# Huge history
export HISTSIZE=10000
# Don't record commands preceded with a blankspace
setopt hist_ignore_space
# Ignore duplicates
setopt hist_ignore_all_dups
# Don't share the history between tabs
unsetopt inc_append_history
unsetopt share_history

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
test -e ${HOME}/.tmuxinator.zsh && source ${HOME}/.tmuxinator.zsh
test -e /usr/local/aws/bin/aws_zsh_completer.sh && source /usr/local/aws/bin/aws_zsh_completer.sh

export GOPATH=~/workspace/go
export PATH="$GOPATH/bin:$PATH"

## Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fpath=(~/.awsume/zsh-autocomplete/ $fpath)

# Automatic terraform/terragrunt version selector
load-tfswitch() {
  if [ -f ".tfswitchrc" ] || [ -f ".terraform-version" ] || [ -f ".tfswitch.toml" ] || [ -f "version.tf" ] || [ -f "providers.tf" ]; then
    tfswitch
  fi
}
load-tgswitch() {
  if [ -f ".tgswitchrc" ] || [ -f ".terragrunt-version" ] || [ -f ".tgswitch.toml" ]; then
    tgswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
add-zsh-hook chpwd load-tgswitch
load-tfswitch
load-tgswitch

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/nomad nomad
prompt_aws(){}

if [ $TERM_PROGRAM != "Terminal.app" ]; then
  eval "$(oh-my-posh init zsh)"
fi
# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

source ~/.zsh_custom_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GPG_TTY=$(tty)
