# Copyright © 2018 Jakub Wilk <jwilk@jwilk.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the “Software”), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

BSDTAR = bsdtar
bsdtar = $(BSDTAR) --format=7zip --absolute-paths

ifeq "$(shell command -v $(BSDTAR);)" ""
$(error bsdtar(1) is needed to create 7zip samples)
endif

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf *.7z tmp* moo* cur* par*

all: absolute1.7z
absolute1.7z:
	umask 022 && echo moo > moo
	$(bsdtar) -cf $(@) -s ,^,/tmp/, moo
	rm -f moo

# TODO: absolute2.7z
# bsdtar(1) doesn't like paths starting with “//”.
# https://github.com/libarchive/libarchive/issues/740

all: relative0.7z
relative0.7z:
	umask 022 && echo moo > moo
	$(bsdtar) -cf $(@) -s ,^,../, moo
	rm -f moo

all: relative2.7z
relative2.7z:
	umask 022 && echo moo > moo
	$(bsdtar) -cf $(@) -s ,^,tmp/../../, moo
	rm -f moo

all: symlink.7z
symlink.7z:
	ln -sf /tmp/moo moo
	umask 022 && echo moo > moo2
	$(bsdtar) -cf $(@) -s,2,, moo moo2
	rm -f moo moo2

all: dirsymlink.7z
dirsymlink.7z:
	ln -sf /tmp tmp
	umask 022 && echo moo > moo
	$(bsdtar) -cf $(@) -s,^moo,tmp/moo, tmp moo
	rm -f tmp moo

all: dirsymlink2a.7z
dirsymlink2a.7z:
	ln -sf . cur
	ln -sf cur/.. par
	mkdir -m 755 par2
	umask 022 && echo moo > par2/moo
	$(bsdtar) -cf $(@) -s,2,, cur par par2
	rm -rf cur par par2

all: dirsymlink2b.7z
dirsymlink2b.7z:
	ln -sf . cur
	ln -sf .. par
	mkdir -m 755 par2
	umask 022 && echo moo > par2/moo
	$(bsdtar) -cf $(@) -s,2,, cur cur/par par2
	rm -rf cur par par2

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
