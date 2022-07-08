# README.md

To utilize this NeoVIM configuration:

1. Install `Neovim`.
2. Install the Vim-plug Plugin Manager:

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. Git Clone this repo. 
```sh
cd ~/.config
git clone git@github.com:SteveLeungYL/NeoVimConfig.git
mv NeoVimConfig nvim
```

4. Launch `Neovim`, and then call `Vim-plug` to install all the plugins.
```sh
nvim
```

and then in the `nvim` command environment:

```
:PlugInstall
```

5. Relaunch `Neovim`. All installation succeed.

