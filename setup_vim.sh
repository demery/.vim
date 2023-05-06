#!/usr/bin/env bash

this_dir=$(dirname $0)
cmd=$(basename $0)

# Create the autoload and pathogen directories if they don't exist
for subdir in autoload bundle
do
  echo "[${cmd}] Ensure directory exists: '${subdir}'"
  [[ -e ${this_dir}/${subdir} ]] || mkdir ${this_dir}/${subdir}
done

# install pathogen
echo "[${cmd}] Make sure pathogen is installed"
curl -LSso ${this_dir}/autoload/pathogen.vim https://tpo.pe/pathogen.vim

read -r -d '' PLUGINS <<'EOF'
  https://github.com/godlygeek/tabular
  https://github.com/ntpeters/vim-better-whitespace
  https://github.com/preservim/nerdtree.git
  https://github.com/scrooloose/nerdcommenter
  https://github.com/tpope/vim-endwise
  https://github.com/tpope/vim-fugitive
  https://github.com/tpope/vim-surround
EOF

read -r -d '' COLORSCHEMES <<'EOF'
  https://github.com/tpope/vim-vividchalk
  https://github.com/wesgibbs/vim-irblack
EOF

# add these bundles
(
  cd ${this_dir}/bundle

  for plugin in ${PLUGINS}
  do
    echo "[${cmd}] Ensure plugin installed '${plugin}'"
    git clone ${plugin}
  done

  # colorschemes
  for colorscheme in ${COLORSCHEMES}
  do
    echo "[${cmd}] Ensure colorscheme installed '${colorscheme}'"
    git clone ${colorscheme}
  done

)


# Create the vim temp dir
vimtmp=${HOME}/.vim-tmp
echo "[${cmd}] Ensure temp dir exists '${vimtmp}'"
[[ -e ${vimtmp} ]] || mkdir -v ${vimtmp}
