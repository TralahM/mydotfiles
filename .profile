#!zsh
# Default programs:
export TERMINAL="urxvt"
export BROWSER="chromium"
export READER="zathura"

if [[ -f /usr/bin/nvim ]] then
    export EDITOR="nvim"
    export GIT_EDITOR='nvim'
else
    export EDITOR="vim"
    export GIT_EDITOR='vim'
fi


export ZSH=~/.zsh
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
export GREP_COLORS='ms=01;32;49'

# ~/ Clean-up:
# export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PIPENV_INSTALL_TIMEOUT=90000

# # Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
# add ~/bin/ to $PATH
if [[ -d $HOME/bin/ ]]; then
    export PATH=$PATH:$HOME/bin
fi

# Nvim config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# Color man pages
# add color to man pages
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS=-R
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

export QT_QPA_PLATFORMTHEME="gtk2"
# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"
# Mozilla smooth scrolling/touchpad
#
export PATH=$PATH:$GOHOME/bin:~/go/bin:$PATH
# Snap apps to path
export PATH=$PATH:/snap/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/go/lib:$LD_LIBRARY_PATH

# display how long all tasks over 10 seconds take
export REPORTTIME=10

hubissues(){
    owner=$1
    repo=$2
    hub api "repos/$owner/$repo/issues"
}
md(){
    mkdir -p $1;
    cd $1;
    pwd;
}

# # ex - archive extractor
# # usage: ex <file>

exarch ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


repos() {
  local user="${1?}"
  shift 1
  paginate hub api -t graphql -f user="$user" "$@" -f query='
    query($user: String!, $per_page: Int = 100, $after: String) {
      user(login: $user) {
        repositories(first: $per_page, after: $after) {
          nodes {
            nameWithOwner
          }
          pageInfo {
            hasNextPage
            endCursor
          }
        }
      }
    }
  '
}

paginate() {
  local output cursor
  output="$("$@")"
  cursor="$(awk '/\.hasNextPage/ { has_next=$2 } /\.endCursor/ { if (has_next=="true") print $2 }' <<<"$output")"
  printf "%s\n" "$output"
  [ -z "$cursor" ] || paginate "$@" -f after="$cursor"
}

# repos "tralahm" | awk '/\.nameWithOwner\t/ { print $2 }'

if [[ -f $HOME/aliasrc ]]; then
    source $HOME/aliasrc
fi

alias ccat="highlight --out-format=ansi"
alias cls="clear"
alias cp="cp -r"
alias djsa="django-admin startapp "
alias djsp="django-admin startproject "
alias g="git"
alias ga="git add "
alias gaci="git add .;git commit "
alias gad="git add ."
alias gap="git add -p"
alias gp="git push "
alias gpf="git fetch "
alias gphm="git push heroku master"
alias gphum="git pull heroku master"
alias gpom="git push origin master"
alias gpum="git pull origin master"
alias grao="git remote add origin "
alias grad="git remote add "
alias grep="egrep --color "
alias grs="git remote set-url "
alias hrkbsh="heroku run bash"
alias hrklgs="heroku logs -t"
alias hrkli="heroku login -i"
alias hrkpyman="heroku run python manage.py "
alias hrkpyshl="heroku run python manage.py shell_plus"
alias hrkrun="heroku run"
alias ipy="ipython"
alias jpynb="jupyter-notebook . &"
alias ka="kill -9"
alias ls="ls -hN --color=auto -t "
alias la="ls -ahN --color=auto -t "
alias mkd="mkdir -p "
alias norg="gron --ungron"
alias p="sudo pacman"
alias pandocx="pandoc -f markdown -t docx --filter=pandoc-docx-pagebreakpy"
alias psaux="ps -aux"
alias pubip="curl icanhazip.com"
alias pythonx="python"
alias sv="sudo $EDITOR"
alias ungron="gron --ungron"
alias v="$EDITOR"
alias vbsh="$EDITOR ~/.bashrc"
alias vf="vifm"
alias vim="$EDITOR "
alias vimrc="$EDITOR ~/.vimrc"
alias vzsh="$EDITOR ~/.zshrc"
alias yt="youtube-dl"


