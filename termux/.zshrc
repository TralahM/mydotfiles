## Options section
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' menu select
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=50000
export WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key

if [[ -f $HOME/aliasrc ]]; then
    source $HOME/aliasrc
fi

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors



# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

## Plugins section: Enable fish style features
# Use syntax highlighting
source $PREFIX/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zmodload zsh/terminfo
zmodload zsh/complist

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])"
    	alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
  *)
        RPROMPT='$(git_prompt_string)'
		# Use autosuggestion
		source $PREFIX/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=300
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vulkan Graphics Library setup
VULKAN_SDK=~/vulkan/1.2.135.0/x86_64
if [[ -d $VULKAN_SDK ]];then
  export PATH=$PATH:$VULKAN_SDK/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VULKAN_SDK/lib
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/:/usr/lib/
  export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d
fi

# Texlive tlmngr
TXPATH=$PREFIX/local/texlive/2020/bin/x86_64-linux
if [[ -d $TXMANPATH ]];then
  export $TXPATH:$PATH; export PATH
fi
TXMANPATH=$PREFIX/local/texlive/2020/texmf-dist/doc/man
if [[ -d $TXMANPATH ]];then
  export $TXMANPATH:$MANPATH; export MANPATH
fi
TXINFOPATH=$PREFIX/local/texlive/2020/texmf-dist/doc/info
if [[ -d $TXINFOPATH ]];then
  export $TXINFOPATH:$INFOPATH; export INFOPATH
fi

# export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_241/
unset JAVA_OPTS
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/data/data/com.termux/files/usr/share/terminfo

if [[ -e ~/.localrc ]];then
    source ~/.localrc
fi
if [[ -e ~/.profile ]];then
    source ~/.profile
fi
if command -v tmux &> /dev/null && [ -z "$TMUX" ];then
    clear;ls
fi




# termux add /usr/local/sbin
if [[ -d /data/data/com.termux/files/usr/local/sbin ]]; then
    export PATH=/data/data/com.termux/files/usr/local/sbin:$PATH
	export PATH=/data/data/com.termux/files/usr/local/bin:$PATH
fi


if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

if [[ -d ~/.rbenv ]]; then
    export PATH=$PATH:~/.rbenv/bin
    eval "$(rbenv init -)"
fi

if [[ -d ~/.cargo/bin/ ]]; then
    export PATH=~/.cargo/bin/:$PATH
fi
# add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"

# move to next word with ctrl-F
bindkey -M viins "^F" vi-forward-word
bindkey -M viins "^[" vi-backward-word
# Move to end of line with ctrl-E
bindkey -M viins "^E" vi-add-eol


export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
export POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_VCS_GIT_ICON=$'\uF113 '
export POWERLEVEL9K_VCS_GIT_ICON='  '
#
if [[ -d $HOME/anaconda3/bin ]];then
    export PATH=$HOME/anaconda3/bin:$PATH
fi



# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=$HOME/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -d $HOME/perl5/ ]];then
  PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
  PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
  PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi
# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
# Golang home config
if [[ -d ~/gocode ]]; then
  export GOHOME=~/gocode
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# alias hub to git
eval $(hub alias -s)

bindkey -v
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export LANG="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

source ~/.profile
source ~/aliasrc
alias heroku='~/node_modules/heroku/bin/run'
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/data/data/com.termux/files/home/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/aliasrc ] && source ~/aliasrc
[ -f ~/.profile ] && source ~/.profile
[ -f ~/.localrc ] && source ~/.localrc

COMPLETION_WAITING_DOTS="true"


source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="$PREFIX/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

source ~/.profile
source ~/aliasrc
### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
zplugin light oldratlee/hacker-quotes
zplugin light webyneter/docker-aliases
zplugin light dbkaplun/smart-cd
zplugin light webyneter/docker-aliases
zplugin light dbkaplun/smart-cd
zplugin light oldratlee/hacker-quotes
zplugin light "chrissicool/zsh-256color"
zplugin light "olets/zsh-abbr"
zplugin light Tarrasch/zsh-bd
zplugin light "arzzen/calc.plugin.zsh"
zplugin light "momo-lab/zsh-abbrev-alias"
zplugin light mtxr/zsh-change-case
zplugin light "changyuheng/fz"
zplugin light "rupa/z"
zplugin light "hlissner/zsh-autopair"
zplugin light "zsh-users/zsh-syntax-highlighting"
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "bhilburn/powerlevel9k"

### End of Zplugin installer's chunk
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
fpath=(~/.zplugin/completions/_zplugin $fpath)
