source ~/.zshrc.d/functions/nothing.zsh
source ~/.zshrc.d/functions/aliases.zsh
source ~/.zshrc.d/functions/git.zsh

function mountiso() {
	sudo mount -o loop $1 /mnt/iso
}

function nosleep() {
	systemd-inhibit --what=handle-lid-switch:sleep --who=$(id -un) --why="I want" --mode=block cat
}

function snakeinit() {
	dir="$(basename $(pwd))"
	git init
	ssh snake git init --bare repos/"$dir".git
	git remote add origin snake:repos/"$dir"
}

function snaekinit() {
	snakeinit
}

function systemctlup() {
	sudo systemctl enable $*
	sudo systemctl start $*
}
