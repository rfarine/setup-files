export ZSH="/Users/raefarine/.oh-my-zsh"

source ~/.zplug/init.zsh
source ~/src/github.com/justworkshr/dev/dev.sh

zplug "dracula/zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

ENABLE_CORRECTION="true"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  rvm
  ruby
  rails
)

AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=122'

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias root="cd ~"
alias jw="dev cd clockwork_web"
alias be="sh ../etc/log_dirs.sh && bundle install && DB=remote bundle exec rails s"
alias sk="DB=remote RAILS_ENV=development bundle exec sidekiq"
alias rs="redis-server --daemonize yes"
alias rt="RUBYOPT='-W0' bundle exec spring rspec"
alias rc="DB=remote RAILS_ENV=development bundle exec rails c"
alias db="mysql.server start"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc

load-nvmrc

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /opt/secrets/current/dev_env_exports.sh
