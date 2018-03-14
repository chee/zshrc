function addalias() {
	aliasfile="$HOME/.zshrc.d/20-alias.zsh"
	echo "alias ${1/=/=\"}\"" >> $aliasfile
	list=$(sort $aliasfile)
	echo $list > $aliasfile
	source $aliasfile
}
