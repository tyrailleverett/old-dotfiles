local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    numbers = "none",
    color_icons = true,
    right_mouse_command = "bdelete! %d",
    show_buffer_close_icons = false,
    show_tab_indicators = false,
    diagnostics = "nvim_lsp",
diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local icon = level:match("error") and " " or " "
  return " " .. icon .. count
end
  },
  highlights = {
    diagnostic_selected = { 
    italic = false, 
    bold = false 
  },
    error_selected = {

        bold = false,
        italic = false,
    },
    error_diagnostic_selected = {
        bold = false,
        italic = false,
    },
    buffer_selected = {
        bold = false,
        italic = false
    },
    warning_diagnostic_selected = {
        bold = false,
        italic = false,
    },
      warning_selected = {
        bold = false,
        italic = false,
    },
    info_diagnostic_selected = {
        bold = false,
        italic = false,
    },
    info_selected = {
        bold = false,
        italic = false,
    },
  }
 
})

vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineCyclePrev<CR>', {})