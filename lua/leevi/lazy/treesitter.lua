return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'base46'
        dofile(vim.g.base46_cache .. 'syntax')
        dofile(vim.g.base46_cache .. 'treesitter')
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc", "javascript", "typescript", "c", "lua", "rust",
                "jsdoc", "bash", 'python', 'tsx' 
            },

            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                use_languagetree = true,
--                additional_vim_regex_highlighting = { "markdown" },
            },
        })

    end
}
