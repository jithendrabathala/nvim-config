return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false,

  keys = {
    {
      '<leader>e',
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd()})
      end,
      desc = "Explorer NeoTree (CWD)"
    },
    { '<C-e>', '<leader>e', remap = true },
  },

  config = function()
    require("neo-tree").setup({
      filesystem = {
      -- This is required for gitignored files to be detected
      enable_git_status = true,

      -- This section controls which files are visible by default
      filtered_items = {
        visible = true,
        hide_dotfiles = false, -- Shows dotfiles like .env
        hide_gitignored = false, -- Shows files from .gitignore
      },

      -- This adds your custom keybinding
      window = {
            mappings = {
            ["H"] = "toggle_hidden", -- Press 'H' to toggle hidden files
          },
        },
      },
    })
  end
}
