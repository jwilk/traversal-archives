.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf *.rar tmp* moo*

ifeq "$(shell which rar)" ""
$(error rar(1) is needed to create RAR samples)
endif

all: absolute1.rar
absolute1.rar:
	umask 022 && echo moo > moo
	rm -f $(@)
	rar a -ap/ $(@) moo
	rm -f moo

all: absolute2.rar
absolute2.rar:
	umask 022 && echo moo > moo
	rm -f $(@)
	rar a -ap// $(@) moo
	rm -f moo

all: relative0.rar
relative0.rar:
	umask 022 && echo moo > moo
	rm -f $(@)
	rar a -ap../ $(@) moo
	rm -f moo

all: relative2.rar
relative2.rar:
	umask 022 && echo moo > moo
	rm -f $(@)
	rar a -aptmp/../../ $(@) moo
	rm -f moo

all: symlink.rar
symlink.rar:
	ln -sf /tmp/moo moo
	rm -f $(@)
	rar a -ol $(@) moo
	rm -f moo
	umask 022 && echo moo > moo
	rar a $(@) moo
	rm -f moo

all: dirsymlink.rar
dirsymlink.rar:
	ln -sf /tmp tmp
	rm -f $(@)
	rar a -ol $(@) tmp
	rm -f tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	rar a $(@) tmp/moo
	rm -rf tmp

# vim:ts=4 sts=4 sw=4 noet
