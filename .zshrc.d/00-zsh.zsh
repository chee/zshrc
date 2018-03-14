##### chee's zsh config
current_path="$PATH"
source /etc/profile
export PATH="$current_path:$PATH"
bindkey -e

setopt nobeep
HISTFILE=$HOME/.zsh_history
HISTSIZE=SAVEHIST=100000000000000000
setopt append_history
setopt share_history
setopt extended_history
setopt histignorealldups
setopt histignorespace

setopt auto_cd
setopt auto_pushd
setopt pushd_ignoredups
typeset -U path cdpath fpath manpath

declare -A abk
setopt interactivecomments

setopt extendedglob
setopt extended_glob
setopt noshwordsplit
setopt unset

setopt longlistjobs
setopt notify

setopt nonomatch

setopt hash_list_all
setopt completeinword

setopt nohup

for mod in parameter complist deltochar mathfunc ; do
	zmodload -i zsh/${mod} 2>/dev/null || print "Notice: no ${mod} available :("
done
zmodload -a  zsh/stat    zstat
zmodload -a  zsh/zpty    zpty
zmodload -ap zsh/mapfile mapfile

autoload compinit
compinit

zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*' original true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=5
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*' verbose true
zstyle ':completion:*:-command-:*:' verbose false
zstyle ':completion:*:warnings' format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:' prompt 'correct to: %e'
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
	/usr/local/bin  \
	/usr/sbin       \
	/usr/bin        \
	/sbin           \
	/bin            \
	/usr/X11R6/bin
zstyle ':completion:*' special-dirs ..
setopt correct
zstyle -e ':completion:*' completer '
if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]] ; then
	_last_try="$HISTNO$BUFFER$CURSOR"
	reply=(_complete _match _ignored _prefix _files)
else
	if [[ $words[1] == (rm|mv) ]] ; then
		reply=(_complete _files)
	else
		reply=(_oldlist _expand _complete _ignored _correct _approximate _files)
	fi
fi'
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'
zstyle ':vcs_info:*' enable git svn hg

autoload zmv
autoload zed
autoload colors
autoload -Uz vcs_info
setopt prompt_subst

precmd() {
	vcs_info
}

p0="%F{red}%(?..%? )%f"
p1="%F{blue}%n%f${NO_COLOR}@%m%40<...<%B%~%b%<<"'${vcs_info_msg_0_}'"» "
if (( EUID == 0 )); then
	PROMPT="%F{blue}${p0}%f%F{red}${p1}%f"
else
	PROMPT="%F{red}${p0}%f%F{blue}${p1}%f"
fi
unset p0 p1

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
