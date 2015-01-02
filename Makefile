.PHONY: all

all: symlink.zip dirsymlink.zip

symlink.zip:
	rm -rf moo
	ln -sf /tmp/moo moo
	zip -X -y $(@) moo
	rm -rf moo
	umask 022 && echo moo > zoo
	zip -X $(@) zoo
	sed -i -e s/zoo/moo/ $(@)
	rm -rf zoo

dirsymlink.zip:
	ln -sf /tmp tmp
	zip -X -y $(@) tmp
	rm -rf tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	zip -X $(@) tmp/moo
	rm -rf tmp

.PHONY: clean
clean:
	rm -f *.zip moo* zoo*

# vim:ts=4 sw=4 noet
