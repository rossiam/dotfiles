alias g=git
alias gdc='git diff --cached'
alias vic='vi $(g s -s|egrep ^UU|cut -d" " -f 2)'
function vif() {
    vi $(find . -name $1 -not -path './build/*' -not -path './bin/*' -print)
}
function vifb() {
    vi $(find . -name $1 -print)
}

function gw() {
    if [[ -f "./gradlew" ]]; then
        ./gradlew "$@"
    elif [[ -f "../gradlew" ]]; then
        ../gradlew "$@"
    fi
}
# alias gw=./gradlew
# alias .gw=../gradlew

alias st="echo no alias set yet"
function sta() {
    if [ "$#" -eq 1 ]
    then
        alias st=~/dev/$1/smartthings-cli/packages/cli/bin/run
        alias dst=~/dev/$1/smartthings-cli/packages/cli/bin/devrun
        cd ~/dev/$1/smartthings-cli
    else
        alias st=~/dev/cli/smartthings-cli/packages/cli/bin/run
        alias dst=~/dev/cli/smartthings-cli/packages/cli/bin/devrun
        cd ~/dev/cli/smartthings-cli
    fi
}
function stv() {
	alias st=~/bin/st-$1
    echo "st aliased to ~/bin/st-$1"
	# alias st=~/bin/st-beta.$1
}
alias vcc="vi ~/.config/@smartthings/cli/config.yaml"

alias pn=pnpm

alias nrc="npm run compile"
alias nrb="npm run build"
alias nrw="npm run watch"
alias nrl="npm run lint"
alias nrt="npm run test"
alias nrtw="npm run test-watch"
alias nrtc="npm run test-coverage"

alias amj='ts-node ~/dev/all-my-junk/cli/bin/run.js'
# alias backup_amj_galileo='rsync -uavz --delete -e ssh ~/dev/all-my-junk galileo:~/amj-backup/ --exclude-from ~/rsync_exclude.txt'
alias backup_amj_tresorit='rsync -uav --delete ~/dev/all-my-junk ~/Tresorit/Backup/ --exclude-from ~/rsync_exclude.txt'
# alias backup_amj_turing='rsync -uavz --delete -e ssh ~/dev/all-my-junk turing:~/amj-backup/ --exclude-from ~/rsync_exclude.txt'
alias pull_amj_from_tresorit='rsync -uav --delete ~/Tresorit/Backup/all-my-junk ~/dev --exclude-from ~/rsync_exclude.txt'

alias use_node='. ~/.nvm/nvm.sh && unalias use_node'
