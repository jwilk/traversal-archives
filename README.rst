Archive samples for testing against directory traversals
========================================================

absolute1::

   -rw-r--r--  /tmp/moo

absolute2::

   -rw-r--r--  //tmp/moo

relative0::

   -rw-r--r--  ../moo

relative2::

   -rw-r--r--  tmp/../../moo

symlink::

   lrwxrwxrwx  moo -> /tmp/moo
   -rw-r--r--  moo

dirsymlink::

   lrwxrwxrwx  tmp -> /tmp
   -rw-r--r--  tmp/moo

The bug-o-rama trophy case
--------------------------

The samples helped find the following bugs:

* arj:

  - https://bugs.debian.org/774434
  - https://bugs.debian.org/774435

* zoo:

  - https://bugs.debian.org/774453

* arc:

  - https://bugs.debian.org/774527

* gcab:

  - https://bugs.debian.org/774580

.. vim:ts=3 sts=3 sw=3 et
