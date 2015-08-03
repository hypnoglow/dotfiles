#!/bin/bash

function dfl () {
	if [! -f "$1" ]; then
		exit
	fi
	FILE=${1}
    #@todo backup file
	rm ~/$FILE
	ln -sv ~/dotfiles/$FILE ~
}