function gd () {
    dirs -v
    echo -n "select number: "
    read newdir
    pushd +"$newdir"
}

function flvget () {
    cp `ls -1 /var/folders/**/FlashTmp* | sed -e ${2:-1}\!d` ~/Movies/$1.mp4
}

