.PHONY: all

all: absolute.zip absolute2.zip symlink.zip dirsymlink.zip

absolute.zip:
	umask 022 && echo moo > mooo
	zip -X $(@) mooo
	rm -f mooo
	sed -i -e s,mooo,/moo, $(@)

absolute2.zip:
	umask 022 && echo moo > moooo
	zip -X $(@) moooo
	rm -f moooo
	sed -i -e s,moooo,//moo, $(@)

symlink.zip:
	ln -sf /tmp/moo moo
	zip -X -y $(@) moo
	rm -f moo
	umask 022 && echo moo > zoo
	zip -X $(@) zoo
	sed -i -e s/zoo/moo/ $(@)
	rm -f zoo

dirsymlink.zip:
	ln -sf /tmp tmp
	zip -X -y $(@) tmp
	rm -f tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	zip -X $(@) tmp/moo
	rm -rf tmp

.PHONY: clean
clean:
	rm -rf *.zip tmp* moo* zoo*

# vim:ts=4 sts=4 sw=4 noet
