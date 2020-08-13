# Copyright © 2018-2020 Jakub Wilk <jwilk@jwilk.net>
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

cpio = cpio -R root:root

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf *.cpio tmp* moo* zoo* cur par

ifeq "$(shell command -v cpio;)" ""
$(error cpio(1) is needed to create cpio samples)
endif

all: absolute1.cpio
absolute1.cpio:
	umask 022 && echo moo > mooooooo
	echo mooooooo | $(cpio) -o > moo.cpio
	rm mooooooo
	perl -pi -e s,mooooooo,/tmp/moo, moo.cpio
	mv moo.cpio $(@)

all: absolute2.cpio
absolute2.cpio:
	umask 022 && echo moo > moooooooo
	echo moooooooo | $(cpio) -o > moo.cpio
	rm moooooooo
	perl -pi -e s,moooooooo,//tmp/moo, moo.cpio
	mv moo.cpio $(@)

all: relative0.cpio
relative0.cpio:
	mkdir -m 755 tmp
	umask 022 && echo moo > moo
	cd ./tmp && echo ../moo | $(cpio) -o > ../moo.cpio
	rm -rf tmp moo
	mv moo.cpio $(@)

all: relative2.cpio
relative2.cpio:
	mkdir -p -m 755 tmp/tmp
	umask 022 && echo moo > moo
	cd ./tmp && echo tmp/../../moo | $(cpio) -o > ../moo.cpio
	rm -rf tmp moo
	mv moo.cpio $(@)

all: symlink.cpio
symlink.cpio:
	ln -sf /tmp/moo moo
	umask 022 && echo moo > zoo
	printf 'moo\nzoo\n' | $(cpio) -o > moo.cpio
	rm -f moo zoo
	perl -pi -e s/zoo/moo/ moo.cpio
	mv moo.cpio $(@)

all: dirsymlink.cpio
dirsymlink.cpio:
	ln -sf /tmp tmp
	mkdir -m 755 moo
	umask 022 && echo moo > moo/moo
	printf 'tmp\nmoo/moo\n' | $(cpio) -o > moo.cpio
	rm -rf tmp moo
	perl -pi -e s,moo/,tmp/, moo.cpio
	mv moo.cpio $(@)

all: dirsymlink2a.cpio
dirsymlink2a.cpio:
	ln -sf . cur
	ln -sf cur/.. par
	mkdir -m 755 moo
	umask 022 && echo moo > moo/moo
	printf 'cur\npar\nmoo/moo\n' | $(cpio) -o > moo.cpio
	rm -rf cur par moo
	perl -pi -e s,moo/,par/, moo.cpio
	mv moo.cpio $(@)

all: dirsymlink2b.cpio
dirsymlink2b.cpio:
	ln -sf . cur
	ln -sf .. par
	mkdir -m 755 moo
	umask 022 && echo moo > moo/moo
	printf 'cur\ncur/par\nmoo/moo\n' | $(cpio) -o > moo.cpio
	rm -rf cur par moo
	perl -pi -e s,moo/,par/, moo.cpio
	mv moo.cpio $(@)

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
