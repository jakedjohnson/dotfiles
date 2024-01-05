#!/bin/bash

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

# Check if asdf is installed
if [ -d "~/.asdf" ]; then
  echo "asdf is installed"
else
  echo "asdf is not installed"
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

echo "Looking for repos directory..."
repos_dir="./repos"

if [ -d "$repos_dir" ]; then
  echo "repos directory found."
  cd repos
else
  echo "repos directory not found. Creating repos directory..."
  mkdir repos && cd repos
fi
