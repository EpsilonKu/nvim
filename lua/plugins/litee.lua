require('litee.lib').setup({
    tree = {
        icon_set = "codicons"
    },
    panel = {
        orientation = "right",
        panel_size  = 30
    },
    term = {
        position = "bottom",
        term_size = 15,
    }
})
require('litee.filetree').setup({
    hide_cursor = false,
})
require('litee.symboltree').setup({
    icon_set = "codicons",
    hide_cursor = false,
})
require('litee.calltree').setup({
    icon_set = "codicons",
    hide_cursor = false,
})
require('litee.bookmarks').setup({
})

