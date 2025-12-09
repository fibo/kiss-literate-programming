# KISS-Literate-Programming

> is a minimal literate programming boilerplate

[![KLP](https://fibo.github.io/svg/badges/klp.svg)](https://fibo.github.io/kiss-literate-programming)

## Description

Merge two beautiful concepts: the [KISS principle](https://en.wikipedia.org/wiki/KISS_principle) and the [Literate programming approach](https://en.wikipedia.org/wiki/Literate_programming).

The *KISS-Literate-Programming* (from now on, KLP) is defined by the following rules:

* All source code and documentation are contained in a *README.md* text file, which is written using [Markdown syntax](https://daringfireball.net/projects/markdown/syntax).
* Source code rows embedded in *README.md* start with 4 spaces; code examples can use the backtick syntax and are ignored. See the [readme template](#readme-template) as example.
* Source code is generated running `make`.

KLP is agnostic about:

* The programming language chosen.
* Installation instructions.

Most of all: KLP does not need an implementation like the one provided here, you can just edit *Makefile* and *README.md* by hand! Of course you can also use `klp` command, see [installation instructions](#installation)

## ADDENDUM

This KLP implementation uses bash and rely on GNU make which is available on every OS.

For a more advanced, yet tiny, tool please check out [markdown2code](https://fibo.github.io/markdown2code).
It is recommended if you have Node.js installed, in particular you can use triple backticks and highlight your code.

## Badge

Add the row below in your markdown file to get a badge

```
[![KLP](https://fibo.github.io/svg/badges/klp.svg)](https://fibo.github.io/kiss-literate-programming)
```

## Usage

Suppose you want to create a shell command, for instance *hello-world.sh*. I suppose
you version it using a *git* repository inside an *hello-world* folder.

```
mkdir hello-world
cd hello-world
klp hello-world.sh
```

Now you have a *README.md* you can edit to add documentation and code. See [this README.md itself](https://raw.githubusercontent.com/fibo/kiss-literate-programming/master/README.md) as example.

## Annotated source

Start a `klp` function

    klp() {

which expects one parameter, otherwise prints its **usage**

    	if [ -z "$1" ]
    	then
    		cat <<-MESSAGE
    		# KISS Literate programming
    		##
    		# Installation instructions, source and license available here:
    		# https://fibo.github.io/kiss-literate-programming
    		##
    		USAGE: klp foo
    		MESSAGE

    		return 1
    	fi

    	TARGET=$1

Check if *README.md* and *Makefile* already exist, do not overwrite them.

    	if [ -e Makefile ]
    	then
    		echo Makefile already exists
    		return 1
    	fi

    	if [ -e README.md ]
    	then
    		echo README.md already exists
    		return 1
    	fi

Generate *README.md*

    	cat <<README > README.md


using the following template
<a name="readme-template"></a>

    <!-- TODO: edit name and description -->
    # name

    > description

    [![KLP](https://fibo.github.io/svg/klp-badge.svg)](https://fibo.github.io/kiss-literate-programming)

    ## Installation

    <!-- TODO: installation instructions here -->

    ## Usage


    ## Annotated source

    Documentation here

        your code here

    more documentation
    more documentation

    ```
    example code
    ```

        more code
        more code more code
        more code more code more code

    more documentation

    ## License

    <!-- TODO: license here -->

Remember to change *name*, *description* and so on.
Please keep the *kiss-literate* badge to support the project.

    README

Generate *Makefile*

    	cat <<MAKEFILE > Makefile
    .PHONY: $TARGET

    $TARGET:
    	grep '    ' README.md | sed -e 's/    //' > $TARGET
    MAKEFILE

Clean up

    	unset TARGET
    }

## Installation

Instructions borrowed from [git-aware-prompt](https://github.com/jimeh/git-aware-prompt#installation).

```
mkdir -p ~/.bash
cd ~/.bash
git clone git://github.com/fibo/kiss-literate-programming.git
```

If you prefer, you can just copy the [klp.sh](https://raw.githubusercontent.com/fibo/kiss-literate-programming/master/klp.sh) somewhere.

Edit your *~/.bash_profile* or *~/.profile* and add the following

```
source ~/.bash/kiss-literate-programming/klp.sh
```

## Requirements

* grep and sed: used for extracting code from *README.md*
* cat: used to generate *Makefile* and *README.md*.
* bash
* make
* git: optionally used for installation


## Examples

Follows a list of examples embracing KLP method:

* [gh-clone](https://github.com/fibo/gh-clone/blob/main/README.md)
* [fibo's home initializer script](https://github.com/fibo/home/blob/gh-pages/README.md)

## License

[MIT](https://fibo.github.io/mit-license)

