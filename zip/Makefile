.PHONY: all
all:
	
.PHONY: clean
clean:
	rm -rf *.zip tmp* moo* zoo*
	
ifeq "$(shell which zip)" ""
$(error zip(1) is needed to create TAR samples)
endif

all: absolute.zip
absolute.zip:
	umask 022 && echo moo > mooooooo
	zip -X -m $(@) mooooooo
	sed -i -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.zip
absolute2.zip:
	umask 022 && echo moo > moooooooo
	zip -X -m $(@) moooooooo
	sed -i -e s,moooooooo,//tmp/moo, $(@)

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
	zip -X -y -m $(@) moo
	umask 022 && echo moo > zoo
	zip -X -m $(@) zoo
	sed -i -e s/zoo/moo/ $(@)

all: dirsymlink.zip
dirsymlink.zip:
	ln -sf /tmp tmp
	zip -X -y -m $(@) tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	zip -X $(@) tmp/moo
	rm -rf tmp


# vim:ts=4 sts=4 sw=4 noet
