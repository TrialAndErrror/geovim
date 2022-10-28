set -e

GREEN="\e[32m"
END="\e[0m"

root=$PWD


echo -e "\n\n${GREEN}Setting up NVim Latest...${END}"
$root/installers/squashfs-root/AppRun --version

sudo mv $root/installers/squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

echo -e "\n\n${GREEN}Setting up Astro Latest...${END}"
mkdir ~/.config/nvim && mv $root/installers/astro/* ~/.config/nvim

echo -e "\n\n${GREEN}Setting up Packer...${END}"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'

echo -e "\n\n${GREEN}Installing language servers: Python, Typescript, ShellCheck, and Tailwind${END}"
nvim --headless -c 'MasonInstall typescript-language-server python-lsp-server tailwindcss-language-server shellcheck' -c q
echo -e "\n\n${GREEN}Installing Formatters: Black and Prettier${END}"

nvim --headless -c 'MasonInstall black prettier' -c q

rm $root/installers/nvim.appimage
rm -rf $root/installers

echo -e "\n\n${GREEN}Writing Config Files...${END}"
sudo mv -f $root/custom_config/core/* ~/.config/nvim/lua/core

echo -e "\n\n${GREEN}Installing Instant...${END}"
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'

echo -e "\n\n${GREEN}Cleaning Up...${END}"
rm -rf $root/custom_config
rm -rf $root/readme.md
rm $root/install.sh

echo -e "\n\n\n${GREEN}Successfully installed Astro NVim. Happy Coding!${END}"
