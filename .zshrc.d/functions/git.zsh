function gcl() {
	git clone $*
	if [ -z "$2" ]; then
		dir="$(basename $1)"
		dir="${dir%%.git}"
	else
		dir="$2"
	fi
	cd $dir
}

function ftcl() {
  cd ~/projects
	gcl git@github.com:Financial-Times/$1
}
