======================================================
Bash for gits: A Bash scripting tutorial for Git users
======================================================

Introduction
~~~~~~~~~~~~

-  Assume everyone is familiar with running commands in a bash shell
-  Note that Mac and Linux bash shells have a few minor differences; we'll see
   some examples when we look at my ``.bashrc`` file
-  Windows 10 now supports Bash using a Linux subsystem, but it is not
   built-in. Still, the concepts presented here apply to the Windows command
   line, even if the syntax does not.

Aliases, scripts, and beyond
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Aliases are good for wrapping long commands or calling scripts: e.g.
   ``master`` and ``la`` in my ``.bashrc``.
-  Scripts are good for stringing a series of commands together or repeating
   the same commands multiple times.
-  Bash is Turing complete, but it isn't really a general purpose programming
   language. If you start finding things getting complicated, it is probably
   time to consider a fully-featured language like Python.
-  Of course, you can write scripts in many high-level programming languages as
   well. Python is a good example. But for automating tasks around your system
   most of the time Bash is quicker and easier to use than Python.
-  give example of Bash script better than Python script, then example of
   Python script better than Bash script.

Building blocks
~~~~~~~~~~~~~~~

-  ``bump.sh``: explain sh extension, shebang, comments, how to use an alias.
-  ``stable.sh``: introduces a for loop and an array.
-  ``rackup.sh``: iterate through repositories and update.
-  ``up.sh``: iterate through directories and repositories and update.

Some other useful scripts
~~~~~~~~~~~~~~~~~~~~~~~~~

-  ``repocheck.sh``: check status of all repositories.
-  ``clean.sh``: cleaning your repositories.
-  include an example of something not git.

Tips
~~~~

-  Tips: set -x and +x, set -e and +e, using &&, be very careful about running
   delete commands
-  Use GitHub: it gives you practice and makes it easy to share your scripts
   between systems and with other people.
-  Always document your scripts!


Where to next
~~~~~~~~~~~~~

-  online tutorials, but to be honest I find with bash it is
   generally more of a need to know thing. When I need to know it, I
   cannibalize my previous work or Google it to see what people have done on
   Stack Overflow. In other words, learn by doing.
