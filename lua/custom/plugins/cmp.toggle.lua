return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- ...
        -- This allows you to enable and disable the autocomplete popup:
        {
            'gitaarik/nvim-cmp-toggle',
            config = function()
            vim.api.nvim_set_keymap('n', '<leader>tc', ':NvimCmpToggle<CR>', { desc = '[T]oggle [C]ompletions', noremap = true, silent = true })
            end,
        },
        -- ...
    },
}
