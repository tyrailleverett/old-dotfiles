

local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics



null_ls.setup {
  sources = {
    formatting.stylua,
    formatting.isort,
    formatting.prettier.with({
      extra_args = { "--trailing-comma none", "--use-tabs" },
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    diagnostics.eslint,
    diagnostics.flake8,
    diagnostics.mypy.with({
      extra_args = {"--strict"}
    })
  },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}


vim.keymap.set("n", "<leader>fd", ":lua vim.lsp.buf.format()<CR>")