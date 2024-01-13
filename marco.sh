#! /usr/bin/env bash
echo "start marco script"
marco(){
    "echo $(pwd)" > "$HOME"/marco_history.log 
}
polo(){
    cd "$(cat marco_history.log)" || exit
}