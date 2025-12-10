
## Description

Merge two beautiful concepts: the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle) and the [Literate programming approach](https://en.wikipedia.org/wiki/Literate_programming).

The *KISS-Literate-Programming* (from now on, KLP) is defined by the following rules:

* All source code and documentation are contained in a *README.md* text file, which is written using [Markdown syntax](https://daringfireball.net/projects/markdown/syntax).
* Source code is generated extracting it from the README.md (e.g. running `make` or some other command).
* Source code to be extracted is usually referred as *Annotated Source*.

KLP is agnostic about:

* The programming language chosen.
* Installation instructions.

## Badge

[![KLP](https://fibo.github.io/svg/badges/klp.svg)](https://fibo.github.io/kiss-literate-programming)

Optionally add the row below in your markdown file to get a badge

```
[![KLP](https://fibo.github.io/svg/badges/klp.svg)](https://fibo.github.io/kiss-literate-programming)
```

## Makefile

Assuming source code rows embedded in *README.md* start with 4 spaces, then code examples can use the backtick syntax and being ignored.

If your target file is called *foo.sh*, then your *Makefile* will look like this:

```
.PHONY: foo.sh

foo.sh:
  grep '    ' README.md | sed -e 's/    //' > foo.sh
```

## Examples

Follows a list of examples embracing KLP method:

* [dir](https://github.com/fibo/dir/blob/main/README.md)
* [gh-clone](https://github.com/fibo/gh-clone/blob/main/README.md)
* [cleanup_git_branches](https://github.com/fibo/cleanup_git_branches/blob/main/README.md)
* [fibo's home initializer script](https://github.com/fibo/home/blob/gh-pages/README.md)

## License

[MIT](https://fibo.github.io/mit-license)

