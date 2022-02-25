
# Requirements
apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

# Build neovim from source
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
# Local user build
# make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME"
# make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME" install
# Root build
make
make install
cd ..
rm -rf neovim
cd
