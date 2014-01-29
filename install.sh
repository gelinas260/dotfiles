clear;
echo -e "--Make sure you are running this from the repo path--\n\n";
read -p "This will override your config files [Y/n]" -n 1 -r
echo    # move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
	rm -rf ~/.vim
	rm -rf ~/.irssi
	rm -rf ~/.vimrc

	ln -s ${PWD}/.vim ~/.vim
	ln -s ${PWD}/.vimrc ~/.vimrc
	cp -r ${PWD}/.irssi ~/.irssi

	echo "YOU NEED TO SET YOUR IRSSI ACCOUNT PASSWORD (count not be directly linked due to personal information)";
fi
