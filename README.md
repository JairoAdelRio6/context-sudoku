# sudoku

## About

ConTeXt module to solve and display sudokus using the famous solver by Peter
Norvig. The module has been reworked so that sudokus can be displayed directly
in running text or within Metafun graphics as another library.

This module provides the following commands, as well as a command handler:

1. `\sudoku` typesets a sudoku if valid.
2. `\startsudoku` and `\stopsudoku` do the same as `\sudoku`, but text goes
   inside the environment.
3. `\sudokufile` typesets a sudoku from a file if valid.
4. `\solvesudoku` solves a sudoku if valid.
5. `\startsolvesudoku` and `\stopsolvesudoku` do the same as `\solvesudoku`, but
   text goes inside the environment.
6. `\solvesudokufile` solves a sudoku from a file if valid.
7. `\randomsudoku` creates a random, unsolved sudoku.
8. `\sudokubuffer` typesets a sudoku from a buffer.
9. `\solvesudokubuffer` solves a sudoku from a buffer if valid.
10. `\setupsudoku` is the command handler for commands above.

`\setupsudoku` understands the following parameters:

```tex
\setupsudoku
  [size=2em,
   evenbackground=,
   oddbackground=gray,
   frame=on,
   rulethickness=.5bp,
   n=42] % for random sudokus
```

`\sudoku` and `\solvesudoku` receive a `text` argument:

```tex
\solvesudoku[text=...]
```

`\sudokufile` and `\solvesudokufile` receive a `file` argument:

```tex
\sudokufile[file=...]
```

`\sudokubuffer` and `\solvesudokubuffer` receive a `buffer` argument:

```tex
\solvesudokubuffer[buffer=...]
```

Within Metafun, however, `lmt_sudoku` is generic and only understands a `text`
parameter. There are three possible alternatives: `display` (to display a sudoku
from a string without solving), `solve` (to solve a sudoku from a string), and
`random` (to generate a random sudoku with N hints, ignoring any `text`
argument).

```metapost
lmt_sudoku [
      alternative = "display",
             text = "...",
             size = 2EmWidth,
   evenbackground = "",
    oddbackground = "red",
            frame = "one",
    rulethickness = .5bp,
                n = 42 % for random sudokus
]
```

Since `lmt_sudoku` draws directly a sudoku, you need to wrap it in an `image` if
further manipulation is required.

## Examples

TLDR: I want examples. Behold, some examples:

- To display a sudoku without solving it:

```tex
\startsudoku
0 0 2 0 0 4 0 0 0 
0 0 8 6 0 0 0 0 0 
0 9 0 0 0 0 0 3 0 
8 0 0 0 6 2 0 0 0 
1 4 0 0 3 0 5 0 9 
0 7 0 0 0 0 0 0 0 
0 3 5 0 0 8 6 0 7 
0 0 0 0 0 0 0 4 2 
0 0 0 9 0 1 0 0 3
\stopsudoku
```

- To solve a sudoku and customize colors a bit:

```tex
\usecolors[svg]

\startsolvesudoku[evenbackground=lemonchiffon]
7 0 0 0 0 4 0 0 1
0 2 0 0 6 0 0 8 0
0 0 1 5 0 0 2 0 0
8 0 0 0 9 0 7 0 0
0 5 0 3 0 7 0 2 0
0 0 6 0 5 0 0 0 8
0 0 8 0 0 9 1 0 0
0 9 0 0 1 0 0 6 0
5 0 0 8 0 0 0 0 3
\stopsolvesudoku
```

- To display a sudoku from a buffer:

```tex
\startbuffer[lmao]
.......... .......1 .....2.3.
....1...4. .3.5.... .26....7.
14...8...5 ........ 7....6.2.
\stopbuffer

\sudokubuffer[buffer=lmao]
```

- To solve a sudoku from a buffer:

```tex
\startbuffer[lmao]
.......... .......1 .....2.3.
....1...4. .3.5.... .26....7.
14...8...5 ........ 7....6.2.
\stopbuffer

\solvesudokubuffer[buffer=lmao]
```

- To display a sudoku from a file without solving:

```tex
\usecolors[svg]

\sudokufile
  [evenbackground=cornsilk,
    oddbackground=pink,
             file=t-sudoku-test-01.txt]
```

- To solve a sudoku from a file:

```tex
\solvesudokufile[file=t-sudoku-test-02.txt]
```

- To create a random sudoku with 45 hints:

```tex
\randomsudoku[n=45]
```

- To use `lmt_sudoku` in Metafun:

```tex
\usemodule[sudoku] % Better by default
% \useMPlibrary[sudoku] will also work if no TeX macros are required

\startMPcode

lmt_sudoku [
    alternative = "random",
              n = 45,
           size = 1.5EmWidth,
 evenbackground = "green"
         % text = ... % will be ignored
];

\stopMPcode

\startMPcode

lmt_sudoku [
    alternative = "display",
           text = "040000000806000007500000100005190060004050000000300091000002436090000000000008020",
           size = 1.5EmWidth
];

\stopMPcode

\startMPcode

lmt_sudoku [
    alternative = "solve",
           text = "040000000806000007500000100005190060004050000000300091000002436090000000000008020",
           size = 1.5EmWidth,
  rulethickness = 1bp,
];

\stopMPcode
```

## Notice

_Caveat emptor_: this module is only for ConTeXt LMTX. I no longer use ConTeXt
MKIV, so no support is provided, sorry. Moreover, I'm using cutting-edge
features, such as new macro extensions. An updated distribution is recommended.