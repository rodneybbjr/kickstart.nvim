-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- local job_id = 0

  -- vim.g.termguicolors = true
return {
  vim.api.nvim_set_option_value('shiftwidth', 2, { scope = 'local' }),
  vim.api.nvim_set_option_value('number', true, { scope = 'local' }),
  -- vim.api.nvim_set_option_value('relativenumber', true, { scope = 'local' }),
  vim.api.nvim_set_option_value('termguicolors', true, { scope = 'global' }),
  -- vim.api.nvim_set_option_value('clipboard', 'unnamedplus', { scope = 'global' }),
  vim.api.nvim_set_var('python3_host_prog', vim.fs.joinpath(vim.fn.stdpath 'config', '.pynvim/bin/python')),

  vim.keymap.set('n', '<space>rf', '<cmd>source %<CR>', { desc = '[R]eload [F]ile' }),

  -- Reload line
  vim.keymap.set('n', '<space>x', ':.lua<CR>', { desc = '[R]eload [L]ine' }),
  -- Reload selection
  vim.keymap.set('v', '<space>x', 'lua<CR>', { desc = '[R]eload [L]ine' }),

  vim.keymap.set('n', '<space>x', ':.lua<CR>', { desc = 'Quickfix Next' }),
  vim.keymap.set('n', '<space>x', ':.lua<CR>', { desc = 'Quickfix Prev' }),

  vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  }),

  -- local job)id = 0
  --
  -- vim.keymap.set('n', '<space>st', function()
  --     vim.cmd.vnew()
  --     vim.cmd.term()
  --     vim.cmd.wincmd 'J'
  -- vim.api.nvim_win_set_height(0, 5)
  -- job_id = vim.bo.channel
  -- end),
}
