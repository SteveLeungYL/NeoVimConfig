# README.md

To utilize this NeoVIM configuration:

1. Install `Neovim`.

```bash
# On Ubuntu
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update -y
sudo apt install neovim -y
sudo apt install ripgrep -y
```

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

6. Install Command Line dependencies:

```bash
sudo apt-get install ripgrep clangd-12
# And with golang configured:
go get golang.org/x/tools/gopls@latest
```

### Issues:

For `completion-nvim`, the current version might not work correctly. The fix is shown below:

From path `~/.vim/plugged/completion-nvim/lua/completion`:

```diff
diff --git a/lua/completion/hover.lua b/lua/completion/hover.lua
index 52bc439..7232873 100644
--- a/lua/completion/hover.lua
+++ b/lua/completion/hover.lua
@@ -355,10 +355,10 @@ M.autoOpenHoverInPopup = function()
       else
         local has_hover = false
         for _, value in pairs(vim.lsp.buf_get_clients(0)) do
-          if value.resolved_capabilities.hover then
-            has_hover = true
-            break
-          end
+          --if value.resolved_capabilities.hover then
+            --has_hover = true
+            --break
+          --end
         end
         if not has_hover then return end
         local row, col = unpack(api.nvim_win_get_cursor(0))
diff --git a/lua/completion/signature_help.lua b/lua/completion/signature_help.lua
index 061fecb..ddf186b 100644
--- a/lua/completion/signature_help.lua
+++ b/lua/completion/signature_help.lua
@@ -15,8 +15,7 @@ M.autoOpenSignatureHelp = function()

   local triggered
   for _, value in pairs(vim.lsp.buf_get_clients(0)) do
-    if value.resolved_capabilities.signature_help == false or
-      value.server_capabilities.signatureHelpProvider == nil then
+    if value.server_capabilities.signatureHelpProvider == nil then
       return
     end

diff --git a/lua/completion/source/lsp.lua b/lua/completion/source/lsp.lua
index 0607ee4..b5746a3 100644
--- a/lua/completion/source/lsp.lua
+++ b/lua/completion/source/lsp.lua
@@ -146,7 +146,7 @@ M.triggerFunction = function(_, params)
     M.callback = true
     return
   end
-  vim.lsp.buf_request(params.bufnr, 'textDocument/completion', position_param, function(err, _, result)
+  vim.lsp.buf_request(params.bufnr, 'textDocument/completion', position_param, function(err, result)
     if err or not result then
       M.callback = true
       return
```
