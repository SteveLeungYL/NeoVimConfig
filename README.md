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

### Issues:

For `completion-nvim`, the current version might not work correctly. The fix is shown below:

The handler function's signature in source/lsp.lua needs to be updated, possibly adding a backwards-compatible wrapper for neovim versions prior to this commit. As an intermediate hack, this should help:

```diff
-  vim.lsp.buf_request(params.bufnr, 'textDocument/completion', position_param, function(err, _, result)
+  vim.lsp.buf_request(params.bufnr, 'textDocument/completion', position_param, function(err, result)
```
