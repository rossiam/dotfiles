#!/usr/bin/env bash

function linkFileDirect {
	if [ $# -ne 2 ]
	then
		echo "❌❌ SCRIPT ERROR; linkFileDirect requires exactly two args, a source and destination"
		return
	fi

	src=$1
	dest=$2

	# echo "linking ${src} to ${dest}"

	if [ ! -f "$src" ]
	then
		echo "❌❌ SCRIPT ERROR; ${src} does not exist"
		return
	fi

	# check if they are hard links
	if [ "$src" -ef "$dest" ]
	then
		echo "✅ ${src} and ${dest} already linked"
		return
	fi

	if [ ! -f "$dest" ]
	then
		ln "$src" "$dest"
		echo "✅ ${src} and ${dest} linked"
		return
	fi

	if diff -q "$src" "$dest"
	then
		rm "$dest"
		ln "$src" "$dest"
		echo "✅ ${src} and ${dest} were identical and are now linked"
		return
	fi

	# file differ
	echo "❌ ${src} and ${dest} both exist and are different; skipping"
}

function linkFile {
	src=$1
	if [ $# -eq 1 ]
	then
		dest="$HOME/.$1"
	elif [ $# -eq 2 ]
	then
		dest="$HOME/.$2/$1"
	else
		echo "❌❌ SCRIPT ERROR; too many or too few args"
		return
	fi

	linkFileDirect "$src" "$dest"
}

script_path=$(realpath "$0")
script_dir=$(dirname "${script_path}")
echo "Syncing dotfiles from $script_dir."

cd "$script_dir"

linkFile gitconfig
linkFile vimrc
linkFile starship.toml config
linkFileDirect alacritty.yaml "$HOME/.config/alacritty.yml"
linkFile tmux.conf
