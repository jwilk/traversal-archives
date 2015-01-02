.PHONY: all clean

include tar.mk
include zip.mk

.PHONY: clean
clean:
	rm -rf tmp* moo* zoo*

# vim:ts=4 sts=4 sw=4 noet
