.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf *.arc tmp* moo*

ifeq "$(shell which arc)" ""
$(error arc(1) is needed to create arc samples)
endif

all: absolute1.arc
absolute1.arc:
	echo moo > mooooooo
	arc m moo.arc mooooooo
	mv moo.arc $(@)
	sed -i -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.arc
absolute2.arc:
	echo moo > moooooooo
	arc m moo.arc moooooooo
	mv moo.arc $(@)
	sed -i -e s,moooooooo,//tmp/moo, $(@)

all: relative0.arc
relative0.arc:
	echo moo > mooooo
	arc m moo.arc mooooo
	mv moo.arc $(@)
	sed -i -e s,mooooo,../moo, $(@)

# vim:ts=4 sts=4 sw=4 noet
