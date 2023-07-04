alias restart="source ~/.zshrc"
alias gccc="gcc -Wall -Wextra -Werror"
alias rmd="rm -rf"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias work="cd ~/Desktop/"
alias vsc="open . -a 'Visual studio code'"
alias cppch="cppcheck --enable=all *.c"
alias cmt="git commit -m"
alias push="git push origin develop"
alias rmcmyo="rm *.cmyo"
TAG=1.3.0

COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o "$1.cmyo"
	./"$1.cmyo"
}

function NR() {
	cURL -l https://raw.githubusercontent.com/080Lin/intensive_script_file/main/.zshrc > ~/.zshrc
	restart
}

function init_setup() {
	if [ ! -d "~/.school_resources_for_peer" ]
	then
		mkdir ~/.school_resources_for_peer
	fi
	cURL -l https://raw.githubusercontent.com/080Lin/intensive_script_file/main/.clang-format > ~/.school_resources_for_peer/.clang-format
}

function weak() {
	leaks -atExit -- ./"$1.cmyo"
}

function clangch() {
	cp ~/.school_resources_for_peer/.clang-format .clang-format
	clang-format -i *.c
	clang-format -n *.c
	rm .clang-format
}

function review() {
	rm -rf *
	git clone -b develop $1
}

function kc() {
	curl -s https://saveski.ru/XcleanX.sh | bash
}

function linscrdoc() {
	cURL -l https://raw.githubusercontent.com/080Lin/intensive_script_file/main/README_RU.md
}
