#
#   __ _     _     
#  / _(_)___| |__  
# | |_| / __| '_ \ 
# |  _| \__ \ | | |
# |_| |_|___/_| |_|
                 
# Starhip Theme
starship init fish | source

set -U EDITOR vim
set -U VISUAL $EDITOR
set -U BUNDLER_EDITOR $EDITOR
set -U HOMEBREW_CASK_OPTS --appdir=/Applications
set -U DOTFILES $HOME/.dotfiles
set -U LC_ALL en_US.UTF-8
set -U LANG en_US.UTF-8
set -U FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
set -U NVM_DIR $HOME/.nvm

for path in $HOME/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
  if test -e $path; and not contains $path $PATH
    set -x PATH $PATH $path
  end
end

set -x PATH $PATH /usr/local/share/npm/bin
set -x PATH $PATH bin
set -x PATH $PATH /usr/local/opt/go/libexec/bin
set -x PATH $PATH /Applications/Postgres.app/Contents/Versions/10/bin
set -x PATH $PATH /usr/local/opt/imagemagick@6/bin
set -x PATH $PATH $HOME/.rvm/bin

# Go
set -x GOPATH $HOME/code/go-workspace
set -x GOROOT /usr/local/opt/go/libexec
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

# Heroku toolbelt
set -x PATH $PATH /usr/local/heroku/bin

set -x MANPATH /usr/local/man


for config in ~/.config/fish/profile/*.fish
  source $config
end

function reload!
  source ~/.config/fish/config.fish
  echo 'Fish config reloaded!'
end

# virtualfish
eval (python3 -m virtualfish)
rvm default