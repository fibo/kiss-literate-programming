klp() {
	if [ -z "$1" ]
	then
		cat <<-MESSAGE
		# KISS Literate programming
		##
		# Installation instructions, source and license available here:
		# https://github.com/fibo/kiss-literate-programming
		##
		USAGE: klp foo
		MESSAGE
		return 1
	fi
	TARGET=$1
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
	cat <<README > README.md
# name

> description

[![KLP](https://img.shields.io/badge/kiss-literate-orange.svg)](https://github.com/fibo/kiss-literate-programming)

## Installation

## Annotated source

Documentation here

    your code here

more documentation
more documentation

    more code
    more code more code
    more code more code more code

## License

README
	cat <<MAKEFILE > Makefile
.PHONY: $TARGET
$TARGET:
	grep '    ' README.md | sed -e 's/    //' > $TARGET
MAKEFILE
	unset TARGET
}
