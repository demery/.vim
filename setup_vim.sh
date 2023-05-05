#!/usr/bin/env bash

this_dir=$(dirname $0)
(
cd ${this_dir}/bundle

git clone https://github.com/godlygeek/tabular
git clone https://github.com/preservim/nerdtree.git 
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/tpope/vim-endwise
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-surround
git clone https://github.com/valloric/youcompleteme

)
