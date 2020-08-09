export QT_QPA_PLATFORMTHEME="qt5ct"
if [[ -f /usr/bin/nvim ]] then
    export EDITOR=/usr/bin/nvim
else
    export EDITOR=/usr/bin/vim
fi
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium
export PATH=$PATH:/home/african/.gem/ruby/2.7.0/bin
if [[ -d $HOME/bin/ ]];then
    export PATH=$PATH:$HOME/bin
fi

hubissues(){
    owner=$1
    repo=$2
    hub api "repos/$owner/$repo/issues"
}

alias gad="git add ."
