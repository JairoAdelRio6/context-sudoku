# Changelog

## [2026-02-14 ("Палестина будет сбоводной")] - 2026-02-14

### Added

- `lmt_sudoku` is now available as a Metafun macro. This also enables
`\useMPmacro[sudoku]`.
- CHANGELOG added. Previous versions won't have a CHANGELOG entry.

### Changed

- Module can now load either with `\usemodule[sudoku]` or
`\useMPlibrary[sudoku]`. Since the first one defines additional TeX macros, this
is the recommended option.
- `\sudoku` _cum suis_ now require arguments passed as key-value pairs. Sudokus
to be displayed or solved have to be passed via `text`, `file`, or `buffer`,
depending on situation. Old syntax no longer works.
- Parameters `oddbackgroundcolor` and `evenbackgroundcolor` are now just
`evenbackground` and `evenbackground` as `TABLE` is no longer used to render
sudokus.
- Due to inconsistencies with previous versions and other modules, I will keep
the YYYY-MM-DD format from now on. No further changes (promise).

### Removed

- Configuration via `TABLE` settings no longer works for it has been moved to
Metafun and has been removed.
