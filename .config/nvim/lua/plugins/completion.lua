return {
  {
    "micangl/cmp-vimtex",
    ft = "tex",
    config = function()
      require('cmp_vimtex').setup({})
    end,
  },
  {
    'saghen/blink.compat',
    version = '*',
    opts = { impersonate_nvim_cmp = false },
  },
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = {
      { 'L3MON4D3/LuaSnip',            version = 'v2.*' },
      { "micangl/cmp-vimtex" },
      { "fang2hou/blink-copilot" },
      { "rafamadriz/friendly-snippets" }
    },

    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },
      snippets = { preset = "luasnip" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = true } },
      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "copilot", "lsp", "path", "snippets", "buffer", "vimtex" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          snippets = {
            score_offset = 1,
          },
          vimtex = {
            name = 'vimtex',
            module = 'blink.compat.source',
            score_offset = 3,
          },
        },
      },
      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },

      signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/luasnip/" })
      local ls = require("luasnip")
      ls.setup({
        update_events = { "TextChanged", "TextChangedI" },
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })
      vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, { silent = true, desc = "expand autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(1) end, { silent = true, desc = "next autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(-1) end, { silent = true, desc = "previous autocomplete" })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true, desc = "select autocomplete" })
    end
  }
}
