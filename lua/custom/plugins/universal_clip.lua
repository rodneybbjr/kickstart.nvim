return {
	{
		'swaits/universal-clipboard.nvim',
		opts = {
  -- Whether to log stuff to the vim console
  verbose = false,

  -- Copy/paste tools to check for
  tools = {
   -- macOS clipboard
   {
    name = "pbcopy",
    detect = function()
     return vim.fn.executable("pbcopy") == 1 and vim.fn.executable("pbpaste") == 1
    end,
    commands = {
     copy = "pbcopy",
     paste = "pbpaste",
    },
   },
   -- Wayland and wl-copy/wl-paste
   {
    name = "wl-clipboard",
    detect = function()
     local wayland_display = os.getenv("WAYLAND_DISPLAY")
     local wayland_runtime = os.getenv("XDG_RUNTIME_DIR")
     local socket_path = (wayland_runtime or "") .. "/" .. (wayland_display or "")
     return (vim.fn.executable("wl-copy") == 1)
      and (vim.fn.executable("wl-paste") == 1)
      and wayland_display ~= ""
      and (vim.fn.filereadable(socket_path) == 1)
    end,
    commands = {
     copy = "wl-copy",
     paste = "wl-paste --no-newline",
    },
   },
   -- Alternative Wayland tools
   {
    name = "waycopy",
    detect = function()
     local wayland_display = os.getenv("WAYLAND_DISPLAY")
     return vim.fn.executable("waycopy") == 1
      and vim.fn.executable("waypaste") == 1
      and wayland_display ~= nil
    end,
    commands = {
     copy = "waycopy",
     paste = "waypaste --no-newline",
    },
   },
   -- X11 and xclip
   {
    name = "xclip",
    detect = "xclip", -- Just a string, means "check if `xclip` is executable"
    commands = {
     copy = "xclip -selection clipboard",
     paste = "xclip -selection clipboard -o",
    },
   },
   -- X11 and xsel
   {
    name = "xsel",
    detect = "xsel",
    commands = {
     copy = "xsel --clipboard --input",
     paste = "xsel --clipboard --output",
    },
   },
   -- tmux clipboard
   {
    name = "tmux",
    detect = function()
     return os.getenv("TMUX") ~= nil and vim.fn.executable("tmux") == 1
    end,
    commands = {
     copy = "tmux load-buffer -",
     paste = "tmux save-buffer -",
    },
   },
   -- Lemonade (SSH)
   {
    name = "lemonade",
    detect = "lemonade",
    commands = {
     copy = "lemonade copy",
     paste = "lemonade paste",
    },
   },
   -- DoIt client (SSH)
   {
    name = "doitclient",
    detect = "doitclient",
    commands = {
     copy = "doitclient wclip",
     paste = "doitclient rclip",
    },
   },
   -- Windows win32yank
   {
    name = "win32yank",
    detect = "win32yank.exe",
    commands = {
     copy = "win32yank.exe -i --crlf",
     paste = "win32yank.exe -o --lf",
    },
   },
  },
 },
	},
}
