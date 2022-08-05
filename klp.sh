klp() {
	if [ -z "$1" ]
	then
		cat <<-MESSAGE
		# KISS Literate programming
		##
		# Installation instructions, source and license available here:
		# http://fibo.github.io/kiss-literate-programming
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
<!-- TODO: edit name and description -->
# name

> description

[![KLP](https://fibo.github.io/svg/klp-badge.svg)](http://fibo.github.io/kiss-literate-programming)

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
README
	cat <<MAKEFILE > Makefile
.PHONY: $TARGET
$TARGET:
	grep '    ' README.md | sed -e 's/    //' > $TARGET
MAKEFILE
	unset TARGET
}
