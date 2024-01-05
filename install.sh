#!/bin/bash

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
