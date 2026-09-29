vim.pack.add({
    'https://github.com/coder/claudecode.nvim',
    'https://github.com/folke/snacks.nvim',
})

require('claudecode').setup()

vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>') -- , desc = "Toggle Claude" },
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>') -- , desc = "Focus Claude" },
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>') -- e<cr>", desc = "Resume Claude" },
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>') -- e<cr>", desc = "Continue Claude" },
vim.keymap.set('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>') -- , desc = "Select Claude model" },
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>') -- , desc = "Add current buffer" },
vim.keymap.set('v', '<leader>as', '<cmd>claudecodesend<cr>')
vim.keymap.set('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>')
vim.keymap.set('n', '<leader>a', function() end)
vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>') -- , desc = "Accept diff" },
vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>') -- , desc = "Deny diff" },
vim.keymap.set('t', '<C-y>', '<C-\\><C-n>')
-- return {
--   "coder/claudecode.nvim",
--   dependencies = { "folke/snacks.nvim" },
--   config = true,
--   keys = {
--     { "<leader>a", nil, desc = "AI/Claude Code" },
--     { "<leader>as", "<cmd>claudecodesend<cr>", mode = "v", desc = "send to claude" },
--     {
--       "<leader>as",
--       "<cmd>ClaudeCodeTreeAdd<cr>",
--       desc = "Add file",
--       ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
--     },
--     -- Diff management
--     { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
--     { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
--   },
-- }
