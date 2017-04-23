dir=~/dotfiles
olddir=~/dotfiles_old
files=".bashrc .bash_profile .bash_aliases .vimrc .xinitrc .tmux.conf .atom"

echo "Creating $olddir for back"
mkdir -p $olddir
echo "..done"

echo "Changing to $dir"
cd $dir
echo "..done"

for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/$file $olddir
	echo "Creating symlink to $file in ~"
	ln -s $dir/$file ~/$file
done
