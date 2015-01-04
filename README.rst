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

   lrwxrwxrwx  moo → /tmp/moo
   -rw-r--r--  moo

dirsymlink::

   lrwxrwxrwx  tmp → /tmp
   -rw-r--r--  tmp/moo

.. vim:ts=3 sts=3 sw=3 et
