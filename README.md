# ComputorV1 [![Actions Status](https://github.com/RadioPotin/computorv1/workflows/build/badge.svg)](https://github.com/RadioPotin/computorv1/actions) [![coverage percentage](https://raw.githubusercontent.com/RadioPotin/computorv1/gh-pages/coverage/badge.svg)](https://RadioPotin.github.io/computorv1/coverage/)

# Building
```
dune build @all
```
creates an executable
```
_build/default/src/computor.exe
```
to which you can feed a polynome to solve.

# Testing
```
dune runtest
```
This will run all tests contained in the folder `ŧest`.

# Usage

```
./_build/default/src/computor.exe <equation>
```

`<equation>` being a string that defines a polynome of degree inferior or equal to 2.

The program accepts an equation if and only if there is at least one monome on each sides of an equal sign.

# Examples of accepted forms of monomes

Each of the following accepted monome forms may be combined in a single polynomial expression though separated by `-` and `+` signs.

Variable `a` stands for a coefficient.

Variable `x` stands for a variable names like "X", "YO" or "papopi"

Variable `n` stands for the exponent part of the term.

`a * x^n`

`ax^n`

`a * x`

`ax`

`x^n`

`x`

`a`
