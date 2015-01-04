.PHONY: all
all:
	
.PHONY: clean
clean:
	rm -rf *.zoo tmp* moo*
	
ifeq "$(shell which zoo)" ""
$(error zoo(1) is needed to create zoo samples)
endif

all: absolute.zoo
absolute.zoo:
	umask 022 && echo moo > mooooooo
	zoo aM $(@) mooooooo
	sed -i -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.zoo
absolute2.zoo:
	umask 022 && echo moo > moooooooo
	zoo aM $(@) moooooooo
	sed -i -e s,moooooooo,//tmp/moo, $(@)

all: relative.zoo
relative.zoo:
	mkdir -m 755 tmp
	umask 022 && echo moo > moo
	cd tmp && zoo a ../$(@) ../moo
	rm -rf tmp moo

all: relative2.zoo
relative2.zoo:
	mkdir -p -m 755 tmp/tmp
	umask 022 && echo moo > moo
	cd tmp && zoo a ../$(@) tmp/../../moo
	rm -rf tmp moo

# vim:ts=4 sts=4 sw=4 noet
