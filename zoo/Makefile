# Copyright © 2015 Jakub Wilk <jwilk@jwilk.net>
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
	rm -rf *.zoo tmp* moo*

ifeq "$(shell which zoo)" ""
$(error zoo(1) is needed to create zoo samples)
endif

all: absolute1.zoo
absolute1.zoo:
	umask 022 && echo moo > mooooooo
	zoo aM $(@) mooooooo
	perl -pi -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.zoo
absolute2.zoo:
	umask 022 && echo moo > moooooooo
	zoo aM $(@) moooooooo
	perl -pi -e s,moooooooo,//tmp/moo, $(@)

all: relative0.zoo
relative0.zoo:
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
