local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    --disable = { "jsx", }, --list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      -- "#5E81AC", "#EBCB8B", "#A3BE8C", "#D08770", "#B48EAD"
      --"#BF616A", "#D08770", "#EBCB8B", "#A3BE8C", "#B48EAD",
      --"#4EC9B0", "#b5cea8", "#d7ba7d", "#C586C0"
      --"#E5C07B", "#61AFEF", "#98C379", "#E06C75"
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
