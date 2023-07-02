alias gccc="gcc -Wall -Wextra -Werror"
alias rmd="rm -rf"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias work="cd ~/Desktop/"
alias vsc="open . -a 'Visual studio code'"
alias cppch="cppcheck --enable=all *.c"
alias cmt="git commit -m"
alias push="git push origin develop"
alias rmcmyo="rm *.cmyo"
TAG=1.2.2

function comp() {
	gcc -Wall -Wextra -Werror "$1.c" -o "$1.cmyo"
	./"$1.cmyo"
}
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

function NR() {
	cURL -l https://raw.githubusercontent.com/080Lin/intensive_script_file/main/.zshrc > ~/.zshrc
	source ~/.zshrc
}

COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '

function move_clang() {
	mkdir ~/.school_resources_for_peer
	cp ../materials/linters/.clang-format ~/.school_resources_for_peer/.clang-format
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
# curl -s https://saveski.ru/XcleanX.sh | bash
# or my upgraded version of script above
#calculating the current available storage
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
Storage="0B"
fi
echo " Available Storage Before Cleaning : || $Storage"
#df -h | grep Users | awk '{print "Before:\t"$2 " = " $3 " + " $4}'
echo " Cleaning ..."
#Trash
/bin/rm -rf ~/.Trash/* &>/dev/null
#General Cache files
/bin/rm -rf ~/Library/Caches/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Caches/* &>/dev/null
#Slack, VSCode, Discord and Chrome Caches
/bin/rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/discord/Cache/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
#.DS_Store files
find ~/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null
#tmp downloaded files with browsers
/bin/rm -rf ~/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null

rm -rf ~/Library/Application\ Support/Slack/Cache
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
rm -rf ~/Library/Application\ Support/Slack/Cache/
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/
rm -rf ~/Library/Application\ Support/Spotify/PersistentCache
rm -rf ~/Library/Application\ Support/Code/Cache
rm -rf ~/Library/Application\ Support/Code/Code\ Cache
rm -rf ~/Library/Application\ Support/Code/CachedData/*
rm -rf ~/Library/Application\ Support/Code/CachedData
rm -rf ~/Library/Application\ Support/Code/CachedExtension
rm -rf ~/Library/Application\ Support/Code/CachedExtensions
rm -rf ~/Library/Application\ Support/Code/CachedExtensionVSIXs
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage
rm -rf ~/Library/Application\ Support/Firefox/Profiles/hdsrd79k.default-release/storage
rm -rf ~/Library/Caches/*
rm -rf ~/Library/Caches
rm -rf ~/Library/Safari/*
rm -rf ~/.Trash/*
rm -rf ~/.kube/cache/*
rm -fr ~/Library/Containers/com.docker.docker/Data/vms/*
rm -fr ~/Library/Containers/com.apple.Safari/Data/Library/Caches/*
rm -rfv ~/Library/Caches/*
rm -rfv ~/Library/Application\ Support/Slack/Cache/*
rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*
rm -rfv ~/Library/Group\ Containers/6N38VWS5BX.ru.keepcoder.Telegram/account-570841890615083515/postbox/*
rm -rfv ~/Library/Caches
rm -rfv ~/Library/Application\ Support/Code/Cache
rm -rfv ~/Library/Application\ Support/Code/CachedData
rm -rfv ~/Library/Application\ Support/Code/CachedExtension
rm -rfv ~/Library/Application\ Support/Code/CachedExtensions
rm -rfv ~/Library/Application\ Support/Code/CachedExtensionVSIXs
rm -rfv ~/Library/Application\ Support/Code/Code\ Cache
rm -rfv ~/Library/Application\ Support/Slack/Cache
rm -rfv ~/Library/Application\ Support/Slack/Code\ Cache
rm -rfv ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage
rm -rfv ~/Library/Application\ Support/Code/User/workspaceStorage
#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
Storage="0B"
fi
sleep 1
echo "Available Storage After Cleaning : || $Storage"

#df -h | grep Users | awk '{print "After:\t"$2 " = " $3 " + " $4}'
}
