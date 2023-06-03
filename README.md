# sudoku

This is a ConTeXt port of a famous sudoku solver by Peter Norvig. It
provides five commands, as well as a command handler:

1. `\sudoku` typesets a sudoku if valid.
2. `\sudokufile` typesets a sudoku from a file if valid.
3. `\solvesudoku` solves a sudoku if valid.
4. `\solvesudokufile` solves a sudoku from a file if valid.
5. `\randomsudoku` creates a random, unsolved sudoku.
6. `\sudokubuffer` typesets a sudoku from a buffer.
7. `\solvesudokubuffer` solves a sudoku from a buffer if valid.
8. `\setupsudoku` is the command handler for commands above.

`\setupsudoku` understands the following parameters:

```tex
\setupsudoku
    [size=2em,
     align={middle,lohi},
     evenbackground=color,
     oddbackground=color,
     evenbackgroundcolor=darkred,
     oddbackgroundcolor=darkblue,
     n=17] % for random sudokus
```

As you might notice, sudokus are just `TABLE`'s in disguise, but only
certain parameters are passed in order to enforce constraints and keep
a sudoku in square shape.

If an invalid sudoku or sudoku file is provided, a placeholder with an
error message is printed instead. To change message errors, set
something like this:

```tex
\setupsudoku
    [placeholdercommand=\inframed,
     placeholderlabela=First error,
     placeholderlabelb=Second error,
     placeholderlabelc=Third error,
     placeholderlabeld=Number too low]
```

For actual examples, check `t-sudoku.mkvi`.
