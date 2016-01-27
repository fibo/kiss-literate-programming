klp() {
    if [ -z "$1" ]
    then
        cat <<-EOF
        # KISS Literate programming
        ##
        # Installation instructions, source and license available here:
        # https://github.com/fibo/kiss-literate-programming
        ##
        USAGE: klp foo
        EOF
      return 0
    fi
    
    TARGET=$1
    echo TODO: check README.md and Makefile do not exist
    echo TODO: generate README.md
    cat <<-MAKEFILE
    .PHONY: klp.sh
    
    $TARGET:
    	grep '    ' README.md | sed -e 's/    //' > $TARGET
    MAKEFILE
    unset TARGET
}
