root=$PWD
mkdir $root/installers && cd $root/installers
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

git clone https://github.com/AstroNvim/AstroNvim ./astro

./nvim.appimage --appimage-extract

sudo rm $root/download.sh
