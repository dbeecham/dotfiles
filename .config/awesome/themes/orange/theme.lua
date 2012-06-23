-- {{{ Initializing stuff.
theme = {}
colors = {}
-- }}}

-- {{{ Global colors.
colors.fg = "#ff6600"
colors.bg = "#000000"
-- }}}

-- {{{ Colors
theme.font = "monospace 7"

theme.fg_normal = "#eeeeee"
theme.fg_focus = colors.fg
theme.fg_urgent = "#ff3300"
theme.fg_minimize = "#777777"

theme.bg_normal = colors.bg
theme.bg_focus = colors.bg
theme.bg_urgent = colors.bg
theme.bg_minimize = colors.bg

theme.border_width = 1
theme.border_normal = "#333333"
theme.border_focus = colors.fg
theme.border_marked = "#ff6600"
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/home/zhaozhou/.config/awesome/themes/orange/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = "/usr/share/awesome/themes/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = "/home/zhaozhou/.config/awesome/themes/orange/layouts/tile.png"
theme.layout_tileleft   = "/home/zhaozhou/.config/awesome/themes/orange/layouts/tileleft.png"
theme.layout_tilebottom = "/home/zhaozhou/.config/awesome/themes/orange/layouts/tilebottom.png"
theme.layout_tiletop    = "/home/zhaozhou/.config/awesome/themes/orange/layouts/tiletop.png"
theme.layout_fairv      = "/home/zhaozhou/.config/awesome/themes/orange/layouts/fairv.png"
theme.layout_fairh      = "/home/zhaozhou/.config/awesome/themes/orange/layouts/fairh.png"
theme.layout_spiral     = "/home/zhaozhou/.config/awesome/themes/orange/layouts/spiral.png"
theme.layout_dwindle    = "/home/zhaozhou/.config/awesome/themes/orange/layouts/dwindle.png"
theme.layout_max        = "/home/zhaozhou/.config/awesome/themes/orange/layouts/max.png"
theme.layout_fullscreen = "/home/zhaozhou/.config/awesome/themes/orange/layouts/fullscreen.png"
theme.layout_magnifier  = "/home/zhaozhou/.config/awesome/themes/orange/layouts/magnifier.png"
theme.layout_floating   = "/home/zhaozhou/.config/awesome/themes/orange/layouts/floating.png"
-- }}}

return theme
