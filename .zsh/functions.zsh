function gd() {
    dirs -v
    echo -n "select number: "
    read newdir
    pushd +"$newdir"
}
