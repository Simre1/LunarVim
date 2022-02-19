local M = {}

M.setup = function ()
  require("lvim.lsp.manager").setup("hls")
  require("rust-tools").setup({
            tools = {
              autoSetHints = true,
              hover_with_actions = true,
              runnables = {
                use_telescope = true,
              },
            },
            server = {
              cmd = { vim.fn.stdpath "data" .. "/lsp_servers/rust/rust-analyzer" },
              on_attach = require("lvim.lsp").common_on_attach,
              on_init = require("lvim.lsp").common_on_init,
            },
            })
end

return M
