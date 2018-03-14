environment=""

function check_path() {
	/usr/bin/env which $1 &> /dev/null
}

check_path brew && environment=osx
check_path apt-get && environment=debian
check_path pacman && environment=arch
check_path yum && environment=redhat
check_path emerge && environment=gentoo

case $environment in
	debian)
		alias get="sudo apt-get install"
		alias search="apt-cache search"
		alias remove="sudo apt-get remove"
		alias upgrade="sudo apt-get update; sudo apt-get upgrade"
    alias information="apt-cache info"
		;;
	arch)
		alias get="pacman -S"
		alias search="pacman -Ss"
		alias remove="sudo pacman -R"
		alias upgrade="pacman -Syu"
    alias information="pacman -Si"
		;;
	osx)
		alias get="brew install"
		alias search="brew search"
		alias remove="brew remove"
		alias upgrade="brew update; brew upgrade"
    alias information="brew info"
		;;
	redhat)
		echo "pkg aliases not set up for yum"
		;;
	gentoo)
		echo "lol fuck off"
		;;
	*)
		echo "what operating system are you on?"
esac
