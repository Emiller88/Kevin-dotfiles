# Kevin-dotfiles

Credit: [best-way-to-store-dotfiles-git-bare-repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

To keep up with my dotfiles.

1. Run this to install
```
curl -Lks https://gist.github.com/Emiller88/20d1dd7a08b165c2ba583697cd92b9bd | /bin/bash
```

or

```
sh install.sh
```

Which calls this:

```  
  git clone --bare https://github.com/Emiller88/Kevin-dotfiles.git $HOME/.cfg
 function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# Install Vim plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
