.PHONY: all
all:
	
.PHONY: clean
clean:
	rm -rf *.arj tmp* moo* zoo*
	
ifeq "$(shell which arj)" ""
$(error arj(1) is needed to create ARJ samples)
else

all: absolute.arj
absolute.arj:
	umask 022 && echo moo > moo
	arj m $(@) moo
	printf '/tmp/moo\n' | arj n $(@)

all: absolute2.arj
absolute2.arj:
	umask 022 && echo moo > moo
	arj m $(@) moo
	printf '//tmp/moo\n' | arj n $(@)

all: relative.arj
relative.arj:
	umask 022 && echo moo > moo
	arj m $(@) moo
	printf '../moo\n' | arj n $(@)

all: relative2.arj
relative2.arj:
	umask 022 && echo moo > moo
	arj m $(@) moo
	printf 'tmp/../../moo\n' | arj n $(@)

all: symlink.arj
symlink.arj:
	ln -sf /tmp/moo moo
	arj m -a $(@) moo
	umask 022 && echo moo > zoo
	arj m -a $(@) zoo
	printf '\nmoo\n' | arj n $(@)

all: dirsymlink.arj
dirsymlink.arj:
	ln -sf /tmp tmp
	arj m -a $(@) tmp
	mkdir -m 755 tmp
	umask 022 && echo moo > tmp/moo
	arj a -a $(@) tmp/moo
	rm -rf tmp

endif

# vim:ts=4 sts=4 sw=4 noet
