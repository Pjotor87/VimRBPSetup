git add README.md
git add vimrc
git add installscript.bash
git add VimTODO.txt
git add GlobalNotes

cd bundle/vim-snippets
git add *
cd ../..

git add uploadchangestogit.bash

git commit -m "Commit and push from bash script."
git push -u origin master
