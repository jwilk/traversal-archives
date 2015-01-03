.PHONY: all
all:
	
.PHONY: clean
clean:
	rm -rf *.arc tmp* moo*
	
ifeq "$(shell which arc)" ""
$(error arc(1) is needed to create arc samples)
else

all: absolute.arc
absolute.arc:
	umask 022 && echo moo > mooooooo
	arc m $(@) mooooooo
	sed -i -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.arc
absolute2.arc:
	umask 022 && echo moo > moooooooo
	arc m moo.arc moooooooo
	mv moo.arc $(@)
	sed -i -e s,moooooooo,//tmp/moo, $(@)

all: relative.arc
relative.arc:
	umask 022 && echo moo > mooooo
	arc m $(@) mooooo
	sed -i -e s,mooooo,../moo, $(@)

all: relative2.arc
relative2.arc:
	umask 022 && echo moo > moooooooooo
	arc m moo.zip moooooooooo
	mv moo.zip $(@)
	sed -i -e s,moooooooooo,t/../../moo, $(@)

endif

# vim:ts=4 sts=4 sw=4 noet
