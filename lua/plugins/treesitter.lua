return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter").install({
            "go",
            "c_sharp",
            "cpp",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "json",
            "bash",
            "python",
        })
    end,
}
