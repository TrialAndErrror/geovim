#!/bin/bash
set -e

GREEN="\e[32m"
END="\e[0m"

root=$PWD

echo -e "\n\n${GREEN}Setting up NVim Latest...${END}"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
rm nvim.appimage

echo -e "\n\n${GREEN}Setting up Astro Latest...${END}"
sudo rm -rf ~/.config/nvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

echo -e "\n\n${GREEN}Setting up Packer...${END}"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo -e "\n\n${GREEN}Installing language servers: Python, Typescript, ShellCheck, and Tailwind${END}"
nvim --headless -c 'MasonInstall typescript-language-server python-lsp-server tailwindcss-language-server shellcheck rust-analyzer' -c q

echo -e "\n\n${GREEN}Installing Formatters: Black and Prettier${END}"
nvim --headless -c 'MasonInstall black prettier' -c q

echo -e "\n\n${GREEN}Writing Config Files...${END}"
sudo cp -r $root/custom_config/core ~/.config/nvim/lua/core
sudo cp -r $root/custom_config/user ~/.config/nvim/lua/user

echo -e "\n\n\n${GREEN}Successfully installed Astro NVim. Happy Coding!${END}"
