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
	rm -rf *.arc tmp* moo*

ifeq "$(shell which arc)" ""
$(error arc(1) is needed to create arc samples)
endif

all: absolute1.arc
absolute1.arc:
	echo moo > mooooooo
	arc m moo.arc mooooooo
	mv moo.arc $(@)
	perl -pi -e s,mooooooo,/tmp/moo, $(@)

all: absolute2.arc
absolute2.arc:
	echo moo > moooooooo
	arc m moo.arc moooooooo
	mv moo.arc $(@)
	perl -pi -e s,moooooooo,//tmp/moo, $(@)

all: relative0.arc
relative0.arc:
	echo moo > mooooo
	arc m moo.arc mooooo
	mv moo.arc $(@)
	perl -pi -e s,mooooo,../moo, $(@)

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
