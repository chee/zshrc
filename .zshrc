# .--------------------------------------------.
# | these are prioritised by 10- sort aliasing |
# *--------------------------------------------*

# 0x: zsh setup (prompt, completion, etc.)
# 1x: environment variables
# 2x: alias
# 3x: reserved
# 4x: initialisation of programs with their own shell scripts
# 5x: reserved
# 6x: functions
# 7x: reserved
# 8x: miscellaneous settings and setup
# 9x: client

for sourceable in $HOME/.zshrc.d/*.zsh; do
	source $sourceable
done
