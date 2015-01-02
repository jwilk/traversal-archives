ifeq "$(shell which zip)" ""
$(warning zip(1) is needed to create TAR samples)
else

all: absolute.zip
absolute.zip:
	umask 022 && echo moo > mooo
	zip -X $(@) mooo
	rm -f mooo
	sed -i -e s,mooo,/moo, $(@)

all: absolute2.zip
absolute2.zip:
	umask 022 && echo moo > moooo
	zip -X $(@) moooo
	rm -f moooo
	sed -i -e s,moooo,//moo, $(@)

all: relative.zip
relative.zip:
	mkdir -m 755 tmp
	umask 022 && echo moo > moo
	cd tmp && zip -X ../$(@) ../moo
	rm -rf tmp moo

all: relative2.zip
relative2.zip:
	mkdir -p -m 755 tmp/tmp
	umask 022 && echo moo > moo
	cd tmp && zip -X ../$(@) tmp/../../moo
	rm -rf tmp moo

all: symlink.zip
symlink.zip:
	ln -sf /tmp/moo moo
	zip -X -y $(@) moo
	rm -f moo
	umask 022 && echo moo > zoo
	zip -X $(@) zoo
	sed -i -e s/zoo/moo/ $(@)
	rm -f zoo

all: dirsymlink.zip
dirsymlink.zip:
	ln -sf /tmp tmp
	zip -X -y $(@) tmp
	rm -f tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	zip -X $(@) tmp/moo
	rm -rf tmp

clean: clean-zip

.PHONY: clean-zip
clean-zip:
	rm -rf *.zip

endif

# vim:ts=4 sts=4 sw=4 noet
