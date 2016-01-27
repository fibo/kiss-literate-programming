klp() {
    if [ -z "$1" ]
    then
        cat <<MESSAGE
  # KISS Literate programming
  ##
  # Installation instructions, source and license available here:
  # https://github.com/fibo/kiss-literate-programming
  ##
  USAGE: klp foo
MESSAGE
      return 0
    fi
    TARGET=$1
    if [ -e Makefile ]
    then
        cat <<MESSAGE
Makefile already exists
MESSAGE
      return 1
    fi
    if [ -e README.md ]
    then
        cat <<MESSAGE
README.md already exists
MESSAGE
      return 1
    fi
    cat <<README > README.md
# name

> description

[![KLP](https://img.shields.io/badge/kiss-literate-orange.svg)](https://github.com/fibo/kiss-literate-programming)

## Installation

## License

README
    cat <<MAKEFILE > Makefile
.PHONY: $TARGET
$TARGET:
	grep '    ' README.md | sed -e 's/    //' > $TARGET
MAKEFILE
    unset TARGET
}
