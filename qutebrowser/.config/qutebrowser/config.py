## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
# c.aliases = {'w': 'session-save', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}
c.aliases = {'1p': 'spawn --userscript 1pass', 'q': 'close', 'qa': 'quit', 'wq': 'quit --save', 'wqa': 'quit --save'}

## Allow JavaScript to read from or write to the clipboard. With
## QtWebEngine, writing the clipboard as response to a user interaction
## is always allowed. On Qt < 6.8, the `ask` setting is equivalent to
## `none` and permission needs to be granted manually via this setting.
## Type: JSClipboardPermission
## Valid values:
##   - none: Disable access to clipboard.
##   - access: Allow reading from and writing to the clipboard.
##   - access-paste: Allow accessing the clipboard and pasting clipboard content.
##   - ask: Prompt when requested (grants 'access-paste' permission).
# c.content.javascript.clipboard = 'ask'

## Enable JavaScript.
## Type: Bool
# c.content.javascript.enabled = True

## Position of the status bar.
## Type: VerticalPosition
## Valid values:
##   - top
##   - bottom
# c.statusbar.position = 'bottom'

## When to show the statusbar.
## Type: String
## Valid values:
##   - always: Always show the statusbar.
##   - never: Always hide the statusbar.
##   - in-mode: Show the statusbar when in modes other than normal mode.
# c.statusbar.show = 'always'

## List of widgets displayed in the statusbar.
## Type: List of StatusbarWidget
## Valid values:
##   - url: Current page URL.
##   - scroll: Percentage of the current page position like `10%`.
##   - scroll_raw: Raw percentage of the current page position like `10`.
##   - history: Display an arrow when possible to go back/forward in history.
##   - search_match: A match count when searching, e.g. `Match [2/10]`.
##   - tabs: Current active tab, e.g. `2`.
##   - keypress: Display pressed keys when composing a vi command.
##   - progress: Progress bar for the current page loading.
##   - text:foo: Display the static text after the colon, `foo` in the example.
##   - clock: Display current time. The format can be changed by adding a format string via `clock:...`. For supported format strings, see https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes[the Python datetime documentation].
# c.statusbar.widgets = ['keypress', 'search_match', 'url', 'scroll', 'history', 'tabs', 'progress']

## How to behave when the last tab is closed. If the
## `tabs.tabs_are_windows` setting is set, this is ignored and the
## behavior is always identical to the `close` value.
## Type: String
## Valid values:
##   - ignore: Don't do anything.
##   - blank: Load a blank page.
##   - startpage: Load the start page.
##   - default-page: Load the default page.
##   - close: Close the window.
c.tabs.last_close = 'close'

## Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
## for a blank page.
## Type: FuzzyUrl
c.url.default_page = 'about:blank'

c.url.start_pages = ['about:blank']
config.load_autoconfig(False)

config.set('content.pdfjs', True)

## Search engines
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    '!g': 'https://www.google.com/search?q={}',
    '!d': 'https://duckduckgo.com/?q={}',
}

## Keybinds
config.bind('<Alt-d>', 'config-cycle colors.webpage.darkmode.enabled true false')

## Nord color palette (matching waybar/sway)
bg        = '#2E3440'
bg_alt    = '#3B4252'
bg_dim    = '#434C5E'
bg_blue   = '#546484'
active    = '#546484'
inactive  = '#4C566A'
text      = '#D8DEE9'
dim       = '#4C566A'
urgent    = '#BF616A'
warning   = '#EBCB8B'
cyan      = '#88C0D0'
blue      = '#5E81AC'

## Fonts
c.fonts.default_family = 'FiraMono Nerd Font Mono'
c.fonts.default_size   = '9pt'

## Completion
c.colors.completion.fg                        = text
c.colors.completion.odd.bg                    = bg_alt
c.colors.completion.even.bg                   = bg
c.colors.completion.category.fg               = cyan
c.colors.completion.category.bg               = bg
c.colors.completion.category.border.top       = bg
c.colors.completion.category.border.bottom    = bg
c.colors.completion.item.selected.fg          = text
c.colors.completion.item.selected.bg          = active
c.colors.completion.item.selected.border.top  = active
c.colors.completion.item.selected.border.bottom = active
c.colors.completion.match.fg                  = warning
c.colors.completion.scrollbar.fg              = text
c.colors.completion.scrollbar.bg              = bg

## Downloads
c.colors.downloads.bar.bg    = bg
c.colors.downloads.start.fg  = text
c.colors.downloads.start.bg  = bg_blue
c.colors.downloads.stop.fg   = text
c.colors.downloads.stop.bg   = cyan
c.colors.downloads.error.fg  = urgent
c.colors.downloads.error.bg  = bg

## Hints
c.colors.hints.fg       = bg
c.colors.hints.bg       = warning
c.colors.hints.match.fg = urgent
c.fonts.hints           = 'bold 9pt FiraMono Nerd Font Mono'

## Keyhint
c.colors.keyhint.fg        = text
c.colors.keyhint.suffix.fg = warning
c.colors.keyhint.bg        = bg_dim

## Messages
c.colors.messages.error.fg     = text
c.colors.messages.error.bg     = urgent
c.colors.messages.error.border = urgent
c.colors.messages.warning.fg   = bg
c.colors.messages.warning.bg   = warning
c.colors.messages.warning.border = warning
c.colors.messages.info.fg      = text
c.colors.messages.info.bg      = bg_dim
c.colors.messages.info.border  = bg_dim

## Prompts
c.colors.prompts.fg          = text
c.colors.prompts.bg          = bg_dim
c.colors.prompts.border      = active
c.colors.prompts.selected.bg = active
c.colors.prompts.selected.fg = text

## Statusbar
c.colors.statusbar.normal.fg      = text
c.colors.statusbar.normal.bg      = bg
c.colors.statusbar.insert.fg      = text
c.colors.statusbar.insert.bg      = bg_blue
c.colors.statusbar.passthrough.fg = text
c.colors.statusbar.passthrough.bg = dim
c.colors.statusbar.private.fg     = text
c.colors.statusbar.private.bg     = bg_dim
c.colors.statusbar.command.fg     = text
c.colors.statusbar.command.bg     = bg
c.colors.statusbar.command.private.fg = text
c.colors.statusbar.command.private.bg = bg_dim
c.colors.statusbar.caret.fg           = text
c.colors.statusbar.caret.bg           = bg_blue
c.colors.statusbar.caret.selection.fg = text
c.colors.statusbar.caret.selection.bg = active
c.colors.statusbar.progress.bg        = cyan

c.colors.statusbar.url.fg              = text
c.colors.statusbar.url.error.fg        = urgent
c.colors.statusbar.url.hover.fg        = cyan
c.colors.statusbar.url.success.http.fg = warning
c.colors.statusbar.url.success.https.fg = cyan
c.colors.statusbar.url.warn.fg         = warning

c.fonts.statusbar = '9pt FiraMono Nerd Font Mono'

## Tabs
c.colors.tabs.bar.bg              = bg
c.colors.tabs.odd.fg              = dim
c.colors.tabs.odd.bg              = bg
c.colors.tabs.even.fg             = dim
c.colors.tabs.even.bg             = bg
c.colors.tabs.selected.odd.fg     = text
c.colors.tabs.selected.odd.bg     = active
c.colors.tabs.selected.even.fg    = text
c.colors.tabs.selected.even.bg    = active
c.colors.tabs.pinned.odd.fg       = dim
c.colors.tabs.pinned.odd.bg       = bg_alt
c.colors.tabs.pinned.even.fg      = dim
c.colors.tabs.pinned.even.bg      = bg_alt
c.colors.tabs.pinned.selected.odd.fg  = text
c.colors.tabs.pinned.selected.odd.bg  = active
c.colors.tabs.pinned.selected.even.fg = text
c.colors.tabs.pinned.selected.even.bg = active
c.colors.tabs.indicator.start     = cyan
c.colors.tabs.indicator.stop      = active
c.colors.tabs.indicator.error     = urgent

c.fonts.tabs.selected   = 'bold 9pt FiraMono Nerd Font Mono'
c.fonts.tabs.unselected = '9pt FiraMono Nerd Font Mono'
