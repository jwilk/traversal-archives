# Copyright © 2015-2018 Jakub Wilk <jwilk@jwilk.net>
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

all: dirsymlink2a.rar
dirsymlink2a.rar:
	ln -sf . cur
	ln -sf cur/.. par
	rm -f $(@)
	rar a -ol $(@) cur par
	rm -f cur par
	mkdir -m 755 par
	umask 022 && echo moo > par/moo
	rar a $(@) par/moo
	rm -rf par

all: dirsymlink2b.rar
dirsymlink2b.rar:
	ln -sf . cur
	ln -sf .. par
	rm -f $(@)
	rar a -ol $(@) cur cur/par
	rm -f cur par
	mkdir -m 755 par
	umask 022 && echo moo > par/moo
	rar a $(@) par/moo
	rm -rf par

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
