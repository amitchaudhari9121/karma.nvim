local util = require("karma.util")
local colors = require("karma.colors")

local M = {}

---@param config Config
---@return Theme
function M.setup(config)
  config = config or require("karma.config")

  ---@class Theme
  local theme = {}
  theme.config = config
  theme.colors = colors.setup(config)
  local c = theme.colors

  theme.base = {
    Comment = { fg = c.gray6, style = config.commentStyle }, -- any comment
    ColorColumn = { bg = c.bg }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.gray6 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor =  { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg_highlight }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    TermCursor  = { link = "Cursor" }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.red }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.fg_gutter }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.gray6 }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.bg }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.gray6 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.yellow2, style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.gray6 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.gray10, bg = c.bg }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg, bg = c.bg }, -- Normal text in floating windows.
    FloatBorder = { fg = c.bg_highlight, bg = c.bg },
    Pmenu = { bg = c.bg, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.yellow2, fg = c.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.gray6 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.red, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.orange, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.orange, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.orange, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.gray10, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.bg }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.bg, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_highlight }, -- Visual mode selection
    VisualNOS = { bg = c.bg }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.red }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.yellow2 }, -- (preferred) any constant
    String = { fg = c.yellow }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.blue, style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.green, style = config.functionStyle }, -- function name (also: methods for classes)

    Statement = { fg = c.blue }, -- (preferred) any statement
    Conditional   = { fg = c.red }, --  if, then, else, endif, switch, etc.
    Repeat        = { fg = c.red }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.blue }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.red, style = config.keywordStyle }, --  any other keyword
    Exception     = { fg = c.yellow }, --  try, catch, throw

    PreProc = { fg = c.red }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.blue }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.blue }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
    Bold = { style = "bold" },
    Italic = { style = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.red }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.gray6 },
    qfFileName = { fg = c.blue },

    htmlH1 = { fg = c.blue, style = "bold" },
    htmlH2 = { fg = c.blue, style = "bold" },

    -- mkdHeading = { fg = c.yellow2, style = "bold" },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.purple, style = "bold" },
    mkdCodeEnd = { fg = c.purple, style = "bold" },
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = { fg = c.yellow2, style = "bold" },
    markdownCode = { fg = c.purple },
    markdownCodeBlock = { fg = c.purple },
    markdownH1 = { fg = c.blue, style = "bold" },
    markdownH2 = { fg = c.blue, style = "bold" },
    markdownLinkText = { fg = c.yellow, style = "underline" },

    debugPC = { bg = c.bg }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.blue, 0.1), fg = c.blue }, -- used for breakpoint colors in terminal-debug

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.yellow2 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.blue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.purple }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = util.darken(c.red, 0.1), fg = c.red }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.darken(c.yellow2, 0.1), fg = c.yellow2 }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.darken(c.blue, 0.1), fg = c.blue }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.darken(c.purple, 0.1), fg = c.purple }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { style = "undercurl", sp = c.red }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = "undercurl", sp = c.yellow2 }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = "undercurl", sp = c.blue }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = "undercurl", sp = c.purple }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.yellow2 },
    LspCodeLens = { fg = c.gray6 },

    ALEErrorSign = { fg = c.red },
    ALEWarningSign = { fg = c.yellow2 },
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.base["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

  theme.plugins = {

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean           = { };    -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    TSNote = { fg = c.bg, bg = c.blue },
    TSWarning = { fg = c.bg, bg = c.yellow2 },
    TSDanger = { fg = c.bg, bg = c.red },
    TSConstructor = { fg = c.blue }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    -- TSConstant          = { };    -- For constants
    -- TSConstBuiltin      = { };    -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    TSField = { fg = c.yellow }, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSInclude           = { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword = { fg = c.purple, style = config.keywordStyle }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = c.blue, style = config.functionStyle }, -- For keywords used to define a fuction.
    TSLabel = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    -- TSNamespace         = { };    -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    TSOperator = { fg = c.blue }, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = { fg = c.yellow }, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    TSProperty = { fg = c.yellow }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = c.blue }, -- For delimiters ie: `.`
    TSPunctBracket = { fg = c.fg_dark }, -- For brackets and parens.
    TSPunctSpecial = { fg = c.blue }, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    TSStringRegex = { fg = c.blue6 }, -- For regexes.
    TSStringEscape = { fg = c.blue }, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    -- TSTypeBuiltin       = { };    -- For builtin types.
    TSVariable = { style = config.variableStyle }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- TSTag               = { };    -- Tags like html tag names.
    -- TSTagDelimiter      = { };    -- Tag delimiter like `<` `>` `/`
    -- TSText              = { };    -- For strings considered text in a markup language.
    TSTextReference = { fg = c.purple },
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    -- luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.blue, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.gray10, bg = c.bg },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.yellow2 },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.gray6 },
    diffIndexLine = { fg = c.blue },

    -- Neogit
    NeogitBranch = { fg = c.blue },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = c.bg_highlight, bg = c.bg },
    TelescopeNormal = { fg = c.fg, bg = c.bg },

    -- NvimTree
    NvimTreeNormal = { fg = c.gray10, bg = c.bg },
    NvimTreeNormalNC = { fg = c.gray10, bg = c.bg },
    NvimTreeRootFolder = { fg = c.blue, style = "bold" },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.purple, style = "underline" },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.gray10 },
    NvimTreeSymlink = { fg = c.blue },
    -- NvimTreeFolderName= { fg = c.fg_float },

    -- Fern
    FernBranchText = { fg = c.blue },

    -- glyph palette
    GlyphPalette1 = { fg = c.red1 },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.blue },
    GlyphPalette6 = { fg = c.yellow },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.red },

    -- Dashboard
    DashboardShortCut = { fg = c.red },
    DashboardHeader = { fg = c.blue },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.yellow, style = "italic" },

    -- WhichKey
    WhichKey = { fg = c.red },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.blue },
    WhichKeySeperator = { fg = c.gray6 },
    WhichKeySeparator = { fg = c.gray6 },
    WhichKeyFloat = { bg = c.bg },
    WhichKeyValue = { fg = c.gray6 },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { bg = c.bg },
    LspFloatWinBorder = { fg = c.bg_highlight },
    LspSagaBorderTitle = { fg = c.red },
    LspSagaHoverBorder = { fg = c.blue },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.blue },
    LspSagaFinderSelection = { fg = c.bg },
    LspSagaCodeActionTitle = { fg = c.blue },
    LspSagaCodeActionContent = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.red },

    -- NeoVim
    healthError = { fg = c.red },
    healthSuccess = { fg = c.yellow },
    healthWarning = { fg = c.yellow2 },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferLineFill = { bg = c.bg },

    -- Barbar
    BufferCurrent = { bg = c.fg_gutter, fg = c.fg },
    BufferCurrentIndex = { bg = c.fg_gutter, fg = c.blue },
    BufferCurrentMod = { bg = c.fg_gutter, fg = c.yellow2 },
    BufferCurrentSign = { bg = c.fg_gutter, fg = c.blue },
    BufferCurrentTarget = { bg = c.fg_gutter, fg = c.red },
    BufferVisible = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleIndex = { bg = c.bg_statusline, fg = c.blue },
    BufferVisibleMod = { bg = c.bg_statusline, fg = c.yellow2 },
    BufferVisibleSign = { bg = c.bg_statusline, fg = c.blue },
    BufferVisibleTarget = { bg = c.bg_statusline, fg = c.red },
    BufferInactive = { bg = c.bg_statusline, fg = c.gray6 },
    BufferInactiveIndex = { bg = c.bg_statusline, fg = c.gray6 },
    BufferInactiveMod = { bg = c.bg_statusline, fg = util.darken(c.yellow2, 0.7) },
    BufferInactiveSign = { bg = c.bg_statusline, fg = c.bg_highlight },
    BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },
    BufferTabpage = { bg = c.bg_statusline, fg = c.bg_highlight },

    -- Sneak
    Sneak = { fg = c.bg_highlight, bg = c.blue },
    SneakScope = { bg = c.bg },

    -- Hop
    HopNextKey = { fg = c.magenta2, style = "bold" },
    HopNextKey1 = { fg = c.blue, style = "bold" },
    HopNextKey2 = { fg = util.darken(c.blue, 0.3) },
    HopUnmatched = { fg = c.gray6 },

    LightspeedGreyWash = { fg = c.gray6 },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.magenta2, style = "bold,underline" },
    LightspeedLabelDistant = { fg = c.yellow, style = "bold,underline" },
    LightspeedLabelDistantOverlapped = { fg = c.green2, style = "underline" },
    LightspeedLabelOverlapped = { fg = c.magenta2, style = "underline" },
    LightspeedMaskedChar = { fg = c.yellow2 },
    LightspeedOneCharMatch = { bg = c.magenta2, fg = c.fg, style = "bold" },
    LightspeedPendingOpArea = { bg = c.magenta2, fg = c.fg },
    LightspeedShortcut = { bg = c.magenta2, fg = c.fg, style = "bold,underline" },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.blue, style = "bold" },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = c.bg },
    CmpDocumentationBorder = { fg = c.bg_highlight, bg = c.bg },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.blue, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = c.none },

    CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },
    CmpItemMenu = { fg = c.gray6, bg = c.none },

    CmpItemKindKeyword = { fg = c.red, bg = c.none },

    CmpItemKindVariable = { fg = c.blue, bg = c.none },
    CmpItemKindConstant = { fg = c.blue, bg = c.none },
    CmpItemKindReference = { fg = c.blue, bg = c.none },
    CmpItemKindValue = { fg = c.blue, bg = c.none },

    CmpItemKindFunction = { fg = c.blue, bg = c.none },
    CmpItemKindMethod = { fg = c.blue, bg = c.none },
    CmpItemKindConstructor = { fg = c.blue, bg = c.none },

    CmpItemKindClass = { fg = c.yellow2, bg = c.none },
    CmpItemKindInterface = { fg = c.yellow2, bg = c.none },
    CmpItemKindStruct = { fg = c.yellow2, bg = c.none },
    CmpItemKindEvent = { fg = c.yellow2, bg = c.none },
    CmpItemKindEnum = { fg = c.yellow2, bg = c.none },
    CmpItemKindUnit = { fg = c.yellow2, bg = c.none },

    CmpItemKindModule = { fg = c.yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.yellow, bg = c.none },
    CmpItemKindField = { fg = c.yellow, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.yellow, bg = c.none },
    CmpItemKindEnumMember = { fg = c.yellow, bg = c.none },
    CmpItemKindOperator = { fg = c.yellow, bg = c.none },
    CmpItemKindSnippet = { fg = c.gray6, bg = c.none },
  }

  theme.defer = {}

  if config.hideInactiveStatusline then
    local inactive = { style = "underline", bg = c.bg, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.base.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end
  end

  return theme
end

return M
