local telescope = require("telescope")
telescope.setup {
  extensions = {
    file_browser = {
      theme = "ivy",

      hijack_netrw = true,
      mappings = {
        ["i"] = {

        },
        ["n"] = {

        },
      }
    }
  }
}
telescope.load_extension("file_browser")
telescope.load_extension("packer")
telescope.load_extension("notify")
