Create symlinks for bashrc

```bash
ln -s ~/code/dotfiles/bashrc ~/.bashrc

mkdir ~/.config
ln -s ~/code/dotfiles/nvim ~/.config/nvim

ln -s ~/code/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/code/dotfiles/aliases ~/.bash_aliases
ln -s ~/code/dotfiles/.git-completion.bash ~/.git-completion.bash
```

Add custom gitconfig to ~/.gitconfig

```
[include]
  path = ~/code/dotfiles/gitconfig
```
