--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is lua file, vim will append your file to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

function getColors()
  local colorTable = {}
  local home = os.getenv("HOME")
  local pywal_colors  = home .. "/.cache/wal/colors"
  file = io.open(pywal_colors, "r")
  for line in file:lines() do
    table.insert(colorTable,line) 
  end
  return colorTable
end

local colors = getColors()

local theme = lush(function()
  local l = 50
  local s = 18
  local color1  = hsl(colors[1]).lighten(l).saturate(s)
  local color2  = hsl(colors[2]).lighten(l).saturate(s)
  local color3  = hsl(colors[3]).lighten(l).saturate(s)
  local color4  = hsl(colors[4]).lighten(l).saturate(s)
  local color5  = hsl(colors[5]).lighten(l).saturate(s)
  local color6  = hsl(colors[6]).lighten(l).saturate(s)
  local color7  = hsl(colors[7]).lighten(l).saturate(s)
  local color8  = hsl(colors[8]).lighten(l).saturate(s)
  local color9  = hsl(colors[9]).lighten(l).saturate(s)
  local color10 = hsl(colors[10]).lighten(l).saturate(s)
  local color11 = hsl(colors[11]).lighten(l).saturate(s)
  local color12 = hsl(colors[12]).lighten(l).saturate(s)
  local color13 = hsl(colors[13]).lighten(l).saturate(s)
  local color14 = hsl(colors[14]).lighten(l).saturate(s)
  local color15 = hsl(colors[15]).lighten(l).saturate(s)
  local color16 = hsl(colors[16]).lighten(l).saturate(s)
  -- local red     = hsl("#ff0000")
  -- local green     = hsl("#00ff00")
  local blue     = hsl("#0000ff")

  -- Onedark theme
  local white         = hsl("#abb2bf")
  local darker_black  = hsl("#1b1f27")
  local black         = hsl("#1e222a") --  nvim bg
  local black2        = hsl("#252931")
  local one_bg        = hsl("#282c34") -- real bg of onedark
  local one_bg2       = hsl("#353b45")
  local one_bg3       = hsl("#30343c")
  local grey          = hsl("#42464e")
  local grey_fg       = hsl("#565c64")
  local grey_fg2      = hsl("#6f737b")
  local light_grey    = hsl("#6f737b")
  local red           = hsl("#d47d85")
  local baby_pink     = hsl("#DE8C92")
  local pink          = hsl("#ff75a0")
  local line          = hsl("#2a2e36") -- for lines like vertsplit
  local green         = hsl("#A3BE8C")
  local vibrant_green = hsl("#7eca9c")
  local nord_blue     = hsl("#81A1C1")
  local blue          = hsl("#61afef")
  local yellow        = hsl("#e7c787")
  local sun           = hsl("#EBCB8B")
  local purple        = hsl("#b4bbc8")
  local dark_purple   = hsl("#c882e7")
  local teal          = hsl("#519ABA")
  local orange        = hsl("#fca2aa")
  local cyan          = hsl("#a3b8ef")
  local statusline_bg = hsl("#22262e")
  local lightbg       = hsl("#2d3139")
  local lightbg2      = hsl("#262a32")

  return {
    -- The following are all the Neovim default highlight groups from the docs
    -- as of 0.5.0-nightly-446, to aid your theme creation. Your themes should
    -- probably style all of these at a bare minimum.
    --
    -- Referenced/linked groups must come before being referenced/lined,
    -- so the order shown ((mostly) alphabetical) is likely
    -- not the order you will end up with.
    --
    -- You can uncomment these and leave them empty to disable any
    -- styling for that group (meaning they mostly get styled as Normal)
    -- or leave them commented to apply vims default colouring or linking.

    Comment       { fg = color11.lighten(25).saturate(20), gui = "italic" }, -- any comment
    ColorColumn   { bg = color1.darken(20) }, -- used for the columns set with 'colorcolumn'
    Conceal       { fg = red.darken(20) }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor        { fg = color9 }, -- character under the cursor
    lCursor       { bg = color3.lighten(10), fg = color10.darken(60) }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM      { bg = color6, fg = color1 }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn  { fg = color8 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine    { bg = color2.darken(50).saturate(-60), fg = color2.lighten(50).saturate(40) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory     { fg = color6 }, -- directory names (and other special names in listings)
    EndOfBuffer   { fg = color2.darken(10) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor    { bg = color6, fg = color1 }, -- cursor in a focused terminal
    TermCursorNC  { bg = color3, fg = color1 }, -- cursor in an unfocused terminal
    ErrorMsg      { bg = color3.lighten(50), fg = color1 }, -- error messages on the command line
    VertSplit     { fg = color2.darken(50) }, -- the column separating vertically split windows
    Folded        { fg = color3.darken(5)}, -- line used for closed folds
    FoldColumn    { fg = color3 }, -- 'foldcolumn'
    SignColumn    { fg = color6 }, -- column where |signs| are displayed
    IncSearch     { bg = color8, fg = color1 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute    { bg = color7, fg = color1 }, -- |:substitute| replacement text highlighting
    LineNr        { fg = color12 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr  { bg = color12.darken(10), fg = color1.darken(30) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen    { fg = color1.lighten(50) }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg       { fg = color6 }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea       { fg = color6.darken(15) },   -- Area for messages and cmdline
    MsgSeparator  { bg = color1.darken(80), fg = color5.lighten(60) }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg       { fg = color6.lighten(10), gui = "italic" }, -- |more-prompt|
    NonText       { fg = color2.darken(20), ctermbg=none }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal        { fg = color1.lighten(50).rotate(50), ctermbg=none }, -- normal text
    NormalFloat   { fg = Normal.fg }, -- Normal text in floating windows.
    NormalNC      { fg = color1.lighten(40).rotate(40) }, -- normal text in non-current windows
    Pmenu         { bg = color2.darken(40).saturate(-40), fg = color8 }, -- Popup menu: normal item.
    PmenuSel      { bg = color5.lighten(20), fg = color3.darken(60) }, -- Popup menu: selected item.
    PmenuSbar     { bg = color2, fg = color1.darken(10) }, -- Popup menu: scrollbar.
    PmenuThumb    { fg = color2 }, -- Popup menu: Thumb of the scrollbar.
    Question      { fg = color5.lighten(30)  }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine  { bg = color3, fg = color3.lighten(50)}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search        { bg = color8.darken(5), fg = color2.darken(10)}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SpecialKey    { bg = color1 , fg = color8.darken(40)  }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad      { fg = color3.darken(25), gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap      { SpellBad}, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal    { SpellBad}, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare     { SpellBad}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine    { bg = color1.lighten(60), fg = color6.darken(60)  }, -- status line of current window
    StatusLineNC  { fg = color2.darken(50), gui="underline" }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine       { StatusLineNC}, -- tab pages line, not active tab page label
    TabLineFill   { PmenuThumb }, -- tab pages line, where there are no labels
    TabLineSel    { Search }, -- tab pages line, active tab page label
    Title         { --[[ bg = color1.lighten(10),]] fg = color2.lighten(20) }, -- titles for output from ":set all", ":autocmd" etc.
    Visual        { bg = color9.darken(20), fg = color6.saturate(20).lighten(20) }, -- Visual mode selection
    VisualNOS     { QuickFixLine }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg    { bg = color1.lighten(15), fg = color6.lighten(70), gui="bold"  }, -- warning messages
    Whitespace    { NonText}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu      { PmenuSel }, -- current match in 'wildmenu' completion
    NvimInternalError  { fg = hsl("#ab0934") },    -- Nvim internal errors

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting

    Constant       { fg = color8.darken(35) }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

     Identifier     { fg = color5.darken(10) }, -- (preferred) any variable name
     Function       { fg = color1.lighten(30)}, -- function name (also: methods for classes)

     Statement      { fg = color4.lighten(40) }, -- (preferred) any statement
     Conditional    { fg = color4.lighten(30) }, --  if, then, else, endif, switch, etc.
     Repeat         { fg = color3.darken(20) }, --   for, do, while, etc.
     Label          { fg = color2.lighten(30)}, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

     PreProc        { fg = color7.darken(30)}, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

     Type           { fg = color1.lighten(70), gui = "bold" }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    Special        { fg=color6.darken(50)}, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

     Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
     Bold       { gui = "bold" },
     Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

     Error          { bg = color6.darken(70), fg = color11.lighten(50),gui="bold"}, -- (preferred) any erroneous construct

     Todo           { Title}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError           { fg = hsl("#ab0934").saturate(-30).lighten(20) , gui = "italic"}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg = hsl("#e0ba0b").saturate(-20) , gui = "italic"}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { fg = color11.darken(25), gui = "italic" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { fg = color7, gui = "italic" }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { fg =  hsl("#e0ba0b").saturate(-50) }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    LspDiagnosticsFloatingError          { fg = LspDiagnosticsDefaultError.fg,       bg = black }, -- Used to color "Error" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingWarning        { fg = LspDiagnosticsDefaultWarning.fg,     bg = black }, -- Used to color "Warning" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingInformation    { fg = LspDiagnosticsDefaultInformation.fg, bg = black }, -- Used to color "Information" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingHint           { fg = LspDiagnosticsDefaultHint.fg,        bg = black }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

		-- LSP Saga
		LspSagaSignatureHelpBorder            { fg = color8.darken(70), bg = black },
		LspSagaShTruncateLine                 { fg = color8.darken(70), bg = black },
		LspFloatWinBorder                     { fg = color8.darken(70), bg = black },	
		LspFloatWinNormal                     { bg = black },

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation         { },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute          { },    -- (unstable) TODO: docs
    TSBoolean            { fg = color6 },    -- For booleans.
    -- TSCharacter          { },    -- For characters.
    -- TSComment            { },    -- For comment blocks.
    TSConstructor        { fg = color6.lighten(20) },    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    -- TSConditional        { },    -- For keywords related to conditionnals.
    TSConstant           { fg = color6 },    -- For constants
    TSConstBuiltin       { fg = color6.darken(20) },    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { },    -- For constants that are defined by macros: `NULL` in C.
    TSError              { fg = hsl("#ab0934") },    -- For syntax/parser errors.
    TSException          { fg = hsl("#ab0934") },    -- For exception related keywords.
    TSField              { fg = color8.lighten(5) },    -- For fields.
    -- TSFloat              { },    -- For floats.
    TSFunction           { fg = color10.lighten(10) },    -- For function (calls and definitions).
    TSFuncBuiltin        { fg = color10.darken(10).rotate(15) },    -- For builtin functions: `table.insert` in Lua.
    TSDecorator          { fg = color15.darken(20) }, 
    TSFuncMacro          { fg = green },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { fg = color13.darken(10).rotate(-15) },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword            { fg = color11.lighten(10).saturate(30).rotate(20) },    -- For keywords that don't fall in previous categories.
    TSKeywordFunction    { fg = color10 },    -- For keywords used to define a fuction.
    -- TSLabel              { },    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod             { fg = color4.lighten(0) },    -- For method calls and definitions.
    -- TSNamespace          { },    -- For identifiers referring to modules and namespaces.
    -- TSNone               { },    -- TODO: docs
    -- TSNumber             { },    -- For all numbers
    -- TSOperator           { },    -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter          { fg = color13.lighten(20) },    -- For parameters of a function.
    -- TSParameterReference { },    -- For references to parameters of a function.
    TSProperty           { fg = color4.darken(20) },    -- Same as `TSField`.
    TSPunctDelimiter     { fg = color7.lighten(30) },    -- For delimiters ie: `.`
    TSPunctBracket       { fg = color8.darken(40) },    -- For brackets and parens.
    TSPunctSpecial       { fg = color7.lighten(10) },    -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat             { },    -- For keywords related to loops.
    TSString             { fg = color13.darken(10).rotate(-30) },    -- For strings.
    TSDocString          { fg = color13.darken(10).rotate(-40) },
    -- TSStringRegex        { },    -- For regexes.
    -- TSStringEscape       { },    -- For escape characters within a string.
    -- TSSymbol             { },    -- For identifiers referring to symbols or atoms.
    TSType               { fg = color12.rotate(5).darken(10) },    -- For types.
    TSTypeBuiltin        { fg = color14.darken(40) },    -- For builtin types.
    TSVariable           { fg = color8.lighten(30) },    -- Any variable name that does not have another highlight.
    TSVariableBuiltin    { fg = color12.lighten(10).rotate(10) },    -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag                { },    -- Tags like html tag names.
    -- TSTagDelimiter       { },    -- Tag delimiter like `<` `>` `/`
    -- TSText               { },    -- For strings considered text in a markup language.
    -- TSEmphasis           { },    -- For text to be represented with emphasis.
    -- TSUnderline          { },    -- For text to be represented with an underline.
    -- TSStrike             { },    -- For strikethrough text.
    -- TSTitle              { },    -- Text that is part of a title.
    -- TSLiteral            { },    -- Literal text.
    -- TSURI                { },    -- Any URI like a link or email.
    MyCustomGroup         { fg = green },

    -- Telescope Groups
    TelescopeMatching       { fg = color3.lighten(5) },
    TelescopeSelection      { fg = color4.lighten(10) },
    TelescopeMultiSelection { fg = color3.lighten(5) },
    -- TelescopeNormal         { bg = color1.lighten(4) },

    -- NvimTree
    NvimTreeFolderIcon        { fg = blue },
    NvimTreeFolderName        { fg = blue },
    NvimTreeOpenedFolderName  { fg = blue },
    NvimTreeEmptyFolderName   { fg = blue },
    NvimTreeIndentMarker      { fg = one_bg2 },
    NvimTreeVertSplit         { fg = darker_black },
    NvimTreeEndOfBuffer       { fg = darker_black },
    NvimTreeRootFolder        { fg = one_bg2.lighten(30) },
    NvimTreeNormal            { fg = one_bg2.lighten(30) },
    NvimTreeStatuslineNc      {  },
    NvimTreeWindowPicker      { bg = black2.lighten(20), fg = red },

    -- Git Signs
    DiffAdd        { fg = vibrant_green.rotate(-10) }, -- diff mode: Added line |diff.txt|
    DiffChange     { fg = dark_purple }, -- diff mode: Changed ine |diff.txt|
    DiffDelete     { fg = red }, -- diff mode: Deleted line |diff.txt|
    DffText        { fg = nord_blue }, -- diff mode: Changed text within a changed line |diff.txt|
    DiffModified   { fg = sun },

    -- Buffer lines or smth, not sure yet what this does
    BufferLineFill                    { fg = grey_fg },         
    BufferLineBackground              { fg = light_grey },   
    BufferLineBufferVisible           { fg = light_grey },    
    BufferLineBufferSelected          { fg = white,      gui="bold" },         

    -- tabs
    BufferLineTab                     { fg = light_grey, bg = one_bg3 },
    BufferLineTabSelected             { fg = black2,     bg = nord_blue },
    BufferLineTabClose                { fg = red },

    BufferLineIndicator               { fg = red },
    BufferLineIndicatorSelected       { fg = color4 },

    -- separators
    BufferLineSeparator               { fg = color4 },
    BufferLineSeparatorVisible        { fg = green },
    BufferLineSeparatorSelected       { fg = blue },

    -- modified buffers
    BufferLineModified                { fg = red,        bg = black2 },
    BufferLineModifiedVisible         { fg = blue,        bg = black2 },
    BufferLineModifiedSelected        { fg = green,      bg = black },

    -- close buttons
    BufferLineCloseButtonVisible      { fg = light_grey },
    BufferLineCloseButton             { fg = light_grey },
    BufferLineCloseButtonSelected     { fg = red       },

  }
end
)

-- Define your lightline theme using groups from our lush spec
--
-- This theme simply flips the background and foreground colours
-- for normal and insert mode.
--
-- Continue below to see how to enable real time updating,
-- then try editing this theme.
--- local lightline_theme = {
---    normal = {
---      left = {
---        {theme.CursorLineNr.fg.hex, theme.CursorLineNr.bg.hex},
---      },
---      middle = {
---        {theme.Normal.fg.hex, theme.Normal.bg.hex},
---      },
---      right = {
---        {theme.StatusLine.fg.hex, theme.StatusLine.bg.hex},
---      },
---    },
---    insert = {
---      left = {
---        {theme.PmenuSbar.bg.hex, theme.PmenuSbar.fg.hex},
---      },
---      middle = {
---        {theme.Normal.bg.hex, theme.Normal.fg.hex},
---      },
---      right = {
---        {theme.StatusLine.bg.hex, theme.StatusLine.fg.hex},
---      },
---    },
---    replace = {
---      left = {
---        {theme.Pmenu.bg.hex, theme.Pmenu.fg.hex},
---      },
---      middle = {
---        {theme.Normal.bg.hex, theme.Normal.fg.hex},
---      },
---      right = {
---        {theme.StatusLine.bg.hex, theme.StatusLine.fg.hex},
---      },
---    },
---    visual = {
---      left = {
---        {theme.WarningMsg.bg.hex, theme.WarningMsg.fg.hex},
---      },
---      middle = {
---        {theme.Normal.bg.hex, theme.Normal.fg.hex},
---      },
---      right = {
---        {theme.StatusLine.bg.hex, theme.StatusLine.fg.hex},
---      },
---    },
---  }

-- Use lightlines helper functions to correct cterm holes in our theme.
-- Note: These functions can be expensive to run, it is recommended you
--       leave them commented out until you wish to work on lightline,
--       or investigate the two-file approach in the other lightline example.
-- local lightline_theme_filled = vim.fn['lightline#colorscheme#fill'](lightline_theme)

-- define our theme for lightline to find
-- vim.g['lightline#colorscheme#lightline_one_file#palette'] = lightline_theme_filled 

-- Technically, that's all you have to do for your lightline theme to
-- be applied but if you want real-time feedback while designing it, you must
-- include some extra code which forces lightline to notice the changes.
--
-- It's recommended you comment out the following code if you're not actively
-- editing your lightline theme.
--
-- You may find realtime performance unacceptable while changes are being
-- propagated back to and applied by vimscript, if this is a problem,
-- you can disable lush.ify() on the buffer (save then `:e!`), then when you
-- wish to preview your changes, save and run `:luafile %`.
--
-- Consider making a temporary mapping while working:
--
--   `:nmap <leader>llr :luafile %<CR>`

-- Lightline is a little tempermental about when you tell it to update it's
-- theme, so we push it to vim's scheduler.
-- vim.schedule(function()
--   -- lightline#colorscheme() has a side effect of not always
  -- applying updates until after leaving insert mode.
--   vim.fn['lightline#colorscheme']()

   -- this will apply more uniforming across all modes, but may have
   -- unacceptable performance impacts.
  --   vim.fn['lightline#disable']()
  --   vim.fn['lightline#enable']()
-- return our parsed theme for extension or use else where.
--
-- end)
return theme

-- vi:nowrap
