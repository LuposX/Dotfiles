-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.keys.normal_mode["<leader>sd"] = ":Telescope file_browser files=false<CR>"
lvim.keys.normal_mode["<leader>mp"] = ":MarkdownPreview<CR>"
lvim.keys.normal_mode["<TAB>"] = ":bnext<CR>"
vim.wo.relativenumber = true
lvim.colorscheme = "gruvbox"
vim.opt.linebreak = true
vim.opt.wrap = true

lvim.plugins = {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[
         function OpenMarkdownPreview (url)
            let cmd = "firefox -P 'Clean' --new-window " . shellescape(a:url) . " &"
            silent call system(cmd)
         endfunction
      ]])
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
      vim.g.mkdp_theme = "dark"
    end,
  },
  {
   "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
      dir_path = "attachments",
      relative_to_current_file = true
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
    },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
  "folke/todo-comments.nvim",
  event = "BufRead",
  config = function()
    require("todo-comments").setup()
  end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
  },
  "kdheepak/cmp-latex-symbols",
  "KeitaNakamura/tex-conceal.vim",
}

require("lvim.lsp.manager").setup("ltex", {
  -- Specify the file types you want ltex to apply to
  filetypes = { "markdown", "tex", "bib", "txt" }
})
