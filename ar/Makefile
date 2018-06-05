# Copyright © 2017-2018 Jakub Wilk <jwilk@jwilk.net>
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
	rm -rf *.a tmp* moo*

ifeq "$(shell which ar)" ""
$(error ar(1) is needed to create ar samples)
endif

all: absolute1.a
absolute1.a:
	echo moo > mooooooo
	ar rD moo.a mooooooo
	rm mooooooo
	perl -pi -e s,mooooooo,/tmp/moo, moo.a
	mv moo.a $(@)

all: absolute2.a
absolute2.a:
	echo moo > moooooooo
	ar rD moo.a moooooooo
	rm moooooooo
	perl -pi -e s,moooooooo,//tmp/moo, moo.a
	mv moo.a $(@)

all: relative0.a
relative0.a:
	echo moo > mooooo
	ar rD moo.a mooooo
	rm mooooo
	perl -pi -e s,mooooo,../moo, moo.a
	mv moo.a $(@)

all: relative2.a
relative2.a:
	echo moo > moooooooooooo
	ar rD moo.a moooooooooooo
	rm moooooooooooo
	perl -pi -e s,moooooooooooo,tmp/../../moo, moo.a
	mv moo.a $(@)

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
