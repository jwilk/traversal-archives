export TAR = bsdtar -P --uid=0 --gid=0

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf *.tar tmp* moo*

ifeq "$(shell which bsdtar)" ""
$(error bsdtar(1) is needed to create tar samples)
endif

all: absolute1.tar
absolute1.tar:
	umask 022 && echo moo > moo
	$(TAR) -cf $(@) -s ,^,/tmp/,  moo
	rm -f moo

# TODO: absolute2.tar
# Unforunately, bsdtar(1) doesn't like paths starting with “//”.
# https:/bugs.debian.org/774445

all: relative0.tar
relative0.tar:
	umask 022 && echo moo > moo
	$(TAR) -cf $(@) -s ,^,../, moo
	rm -f moo

all: relative2.tar
relative2.tar:
	umask 022 && echo moo > moo
	$(TAR) -cf $(@) -s ,^,tmp/../../, moo
	rm -f moo

all: symlink.tar
symlink.tar:
	ln -sf /tmp/moo moo
	$(TAR) -cf $(@) moo
	rm -f moo
	umask 022 && echo moo > moo
	$(TAR) -rf $(@) moo
	rm -f moo

all: dirsymlink.tar
dirsymlink.tar:
	ln -sf /tmp tmp
	$(TAR) -cf $(@) tmp
	rm -f tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	$(TAR) -rf $(@) tmp/moo
	rm -rf tmp

# vim:ts=4 sts=4 sw=4 noet
