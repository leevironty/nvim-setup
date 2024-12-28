vim.cmd("language en_US")
if vim.g.vscode then
    require('vscconf')
else
    require("leevi")
end

