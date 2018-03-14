path=(
	# lol, this dangerous idea
	./bin

	# my own little programs
	$HOME/bin

	/lib/ccache/bin
	$DEVKITARM/bin

	# gnu coreutils on OS X
	/usr/local/opt/coreutils/libexec/gnubin

	# GOOOOOOOO
	/usr/local/opt/go/libexec/bin
	/usr/local/go/bin
	$GOPATH/bin

	# ANDORIDTOOL
	$ANDROID_HOME/tools
	$ANDROID_HOME/platform-tools

	# locally built binaries live in .local/bin
	$HOME/.local/bin

	# ugh
	$HOME/.yarn/bin

	# crazily not in path in a lot of environments
	/usr/local/bin
	/usr/local/sbin

	# rust
	$HOME/.multirust/toolchains/nightly/cargo/bin

	# python
	$HOME/.pyenv/bin

	# pear
	$HOME/pear/bin

	# DANGEROUS: WILL CAUSE ANY BILLIONS OF SCRIPTS TO FAIL
	# UNCOMMENT ONLY IF YOU ARE LITERALLY A SWINDLING SNEATHE
	# /usr/local/opt/gnu-sed/libexec/gnubin

	$path
)

fpath=(
	$HOME/.local/share/zsh-completions/
	/usr/share/zsh/site-functions/
	/usr/local/share/zsh/site-functions/
	$fpath
)

export PATH
