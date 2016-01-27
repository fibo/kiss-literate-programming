
.PHONY: klp.sh

klp.sh:
	grep '    ' README.md | sed -e 's/    //' > klp.sh

