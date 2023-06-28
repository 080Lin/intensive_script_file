alias gccc="gcc -Wall -Wextra -Werror"
alias rmd="rm -rf"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias work="cd ~/Desktop/pj"
alias vsc="open . -a 'Visual studio code'"
alias cppch="cppcheck --enable=all *.c"
alias cmt="git commit -m"
alias push="git push origin develop"

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o $1
	./$1
}

function weak() {
	leaks -atExit -- ./$1
}

function review() {
	rm -rf *
	git clone -b develop $1
}

function kc() {
echo '----------------------'
echo '\033[37;1;41mSize    Used    Avail\033[0m'
echo '----------------------'
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'
#df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
#df -h | created/by/mmargene\Support/Peer/sh
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Caches/*
rm -rf ~/.Trash/*
rm -rf ~/Library/Safari/*
rm -rf ~/.kube/cache/*
rm -rf ~/Library/Application\ Support/Code/CachedData/*
rm -rf ~/Library/Application\ Support/Code/User/workspaceStoratge
rm -fr ~/Library/Containers/com.docker.docker/Data/vms/*
rm -fr ~/Library/Containers/com.apple.Safari/Data/Library/Caches/*
rm -rf ~/Library/Application\ Support/Firefox/Profiles/hdsrd79k.default-release/storage
df -h | grep Users | awk '{print $2 " = " $3 " + "  $4}'y
#df -h | awk 'NR == 8{print $2 " = " $3 " + "  $4}'
echo '----------------------'% 
}
