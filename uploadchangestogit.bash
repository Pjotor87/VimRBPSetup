git add README.md
git add vimrc
git add installscript.bash
git add VimTODO.txt
git add GlobalNotes

git add bundle
cd bundle
git add vim-snippets
cd vim-snippets
git add .
cd ../..

git add uploadchangestogit.bash

git commit -m "Commit and push from bash script."
git push -u origin master
