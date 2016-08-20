# 1. Uppdatera systemet
# ---------------------
sudo apt-get --assume-yes update
# 2. Installera Vim
# -----------------
sudo apt-get --assume-yes install vim
# 3. Installera Git
# -----------------
sudo apt-get --assume-yes install git
# 4. Installera Python
# --------------------
PYTHON_IS_INSTALLED=$(which python)
if [ -z "$PYTHON_IS_INSTALLED" ]; then
	sudo apt-get --assume-yes install python
else
	echo "Python detected. Skipping python installation."
fi
# 5. Installera Pip
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

################TEST PASSED LINE##################

# 6. Skapa förutsättningar för plugins med pathogen
# -------------------------------------------------
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 7. Installera plugins som pathogen kör
# --------------------------------------
#   Navigera till bundle-mappen och kör:
#   git clone https://github.com/scrooloose/nerdtree.git
#   git clone https://github.com/klen/rope-vim.git
#   git submodule add https://github.com/msanders/snipmate.vim.git snipmate
#   git clone https://github.com/garbas/vim-snipmate.git
#   git clone https://github.com/honza/vim-snippets.git
#   git clone https://github.com/tomtom/tcomment_vim.git
#   git clone https://github.com/tomtom/tlib_vim.git
#   git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
#   git clone https://github.com/vim-scripts/pylint-mode.git
#   git clone https://github.com/tell-k/vim-autopep8.git
#   git clone --depth=1 https://github.com/scrooloose/syntastic.git
#   git clone https://github.com/tmhedberg/SimpylFold.git

# 8. Installera möjlighet att debugga pythonskript
# ------------------------------------------------
#   sudo pip install ipython
#   sudo pip install ipdb

# 9. Ta ner min vimrc fil
# -----------------------
#   Navigera till ~/.vim/ och kör:
#   git clone https://github.com/Pjotor87/VimRBPSetup.git
