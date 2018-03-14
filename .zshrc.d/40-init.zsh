# for initialising programs that have their own shell magic
if [ -e /usr/local/opt/chruby/share/chruby/auto.sh ]; then
	source /usr/local/opt/chruby/share/chruby/auto.sh
fi
if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
	source /usr/local/opt/chruby/share/chruby/chruby.sh
fi
if [ -e /usr/share/chruby/auto.sh ]; then
	source /usr/share/chruby/auto.sh
fi
if [ -e /usr/share/chruby/chruby.sh ]; then
	source /usr/share/chruby/chruby.sh
fi
