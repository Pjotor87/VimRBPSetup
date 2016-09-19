echo "***************************************"
echo "*** Running Vim installation script ***"
echo "***************************************"
# 1. Uppdatera systemet
# ---------------------
sudo apt-get --assume-yes update
# 2. Installera Vim och Git
# -----------------
sudo apt-get --assume-yes install vim
sudo apt-get --assume-yes install git
# 3. Installera Python
# --------------------
PYTHON_IS_INSTALLED=$(which python)
if [ -z "$PYTHON_IS_INSTALLED" ]; then
	sudo apt-get --assume-yes install python
else
	echo "Python detected. Skipping python installation."
fi
# 4. Installera Pip
# -----------------
# Get the version by running a short piece of python code
PYTHON_VERSION_TUPLE=$( python -c 'import sys; print(sys.version_info[:])' )
# Type cast by iterating the tuple output returned from python and concatenating a string
PYTHON_VERSION=""
for Value in $PYTHON_VERSION_TUPLE; do
	PYTHON_VERSION=$PYTHON_VERSION$Value
done
# Check if the installed python version is 2,7 or 3+ and install pip accordingly
if [[ $PYTHON_VERSION == "(2,7"* ]]; then
	sudo apt-get --assume-yes install python-pip
elif [[ $PYTHON_VERSION == "(3,"* ]]; then
	sudo apt-get --assume-yes install python3-pip
else
	echo "Python version unknown. Skipping pip installation."
fi
# 5. Installera möjlighet att debugga pythonskript
# ------------------------------------------------
sudo pip install ipython
sudo pip install ipdb
# 6. Skapa förutsättningar för Vim plugins med pathogen
# -----------------------------------------------------
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# 7. Installera plugins som pathogen kör
# --------------------------------------
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/vim-scripts/pylint-mode.git ~/.vim/bundle/pylint-mode
git clone https://github.com/tmhedberg/SimpylFold.git ~/.vim/bundle/SimpylFold
git clone --depth=1 https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/tomtom/tcomment_vim.git ~/.vim/bundle/tcomment_vim
git clone https://github.com/klen/rope-vim.git ~/.vim/bundle/rope-vim
# Snippets START
# Snipmate
# --------
# git clone https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib_vim
# git clone https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/vim-addon-mw-utils
# git clone https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/vim-snipmate
# Ultisnips
# ---------
git clone https://github.com/SirVer/ultisnips.git  ~/.vim/bundle/ultisnips
# Snippets
# --------
git clone https://github.com/honza/vim-snippets.git ~/.vim/bundle/vim-snippets
# Snippets END
# git clone https://github.com/tell-k/vim-autopep8.git ~/.vim/bundle/autopep8
# git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8
# 8. Ta ner mitt Vim repository med vimrc fil bl.a.
# -------------------------------------------------
git clone https://github.com/Pjotor87/VimRBPSetup.git ~/.vim
echo "****************************************"
echo "*** Vim installation script finished ***"
echo "****************************************"
