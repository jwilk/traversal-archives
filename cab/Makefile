.PHONY: all
all:
	
.PHONY: clean
clean:
	rm -rf *.cab *'\\'*
	
ifeq "$(shell which lcab)" ""
$(error lcab(1) is needed to create Microsoft cabinet samples)
endif

all: absolute.cab
absolute.cab:
	echo moo > '\tmp\moo'
	lcab '\tmp\moo' $(@)
	rm -f '\tmp\moo'

all: absolute2.cab
absolute2.cab:
	echo moo > '\\tmp\moo'
	lcab '\\tmp\moo' $(@)
	rm -f '\\tmp\moo'

all: relative.cab
relative.cab:
	echo moo > '..\moo'
	lcab '..\moo' $(@)
	rm -f '..\moo'

all: relative2.cab
relative2.cab:
	echo moo > 'tmp\..\..\moo'
	lcab 'tmp\..\..\moo' $(@)
	rm -f 'tmp\..\..\moo'

# vim:ts=4 sts=4 sw=4 noet
