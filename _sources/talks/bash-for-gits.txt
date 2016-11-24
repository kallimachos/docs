======================================================
Bash for gits: A Bash scripting tutorial for Git users
======================================================

.. ifslides::

   .. rst-class:: title-image

      .. figure:: ../images/bash-logo.png

Introduction
~~~~~~~~~~~~

.. rst-class:: build

-  This tutorial assumes you are familiar with running commands in a bash shell
-  Mac and Linux bash shells have a few minor differences; we'll see
   some examples when we look at my ``.bashrc`` file
-  Windows 10 now supports Bash using a Linux subsystem, but it is not
   built-in. Still, the concepts presented here apply to the Windows command
   line, even if the syntax does not.

.bashrc
~~~~~~~

``.bashrc`` is executed when you open a Bash terminal. It is useful for
setting certain configuration options and creating aliases.

If you make a change to ``.bashrc``, you must either open a new terminal or
run ``source .bashrc`` in order for the changes to take effect.

In this example, we configure the prompt, add an application to the PATH, and
create some aliases.

.. code::

   # Set prompt
   PS1="[\u \W]\$ "

   # Path additions
   export PATH=/opt/Komodo-Edit-10/bin:$PATH

   # User specific aliases and functions

   alias grep='grep --color=auto'
   alias la='ls -laG'
   alias master='git checkout master'
   alias p3='python3'
   alias p='python'

Handling different operating systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Because ``.bashrc`` is executed, it can include arbitrary code.

In this example, an ``if`` clause is used to set aliases depending on the
operating system.

.. code::

   # Handle differences between Mac and Linux OS
   if [[ $OSTYPE =~ ^darwin ]]; then
       alias fox='open -a "firefox"'
       alias go='open'
       alias ls='ls -G'
       alias music='open -a "itunes"'
   else
       alias fox='setsid firefox >/dev/null 2>&1'
       alias go='gnome-open'
       alias ls='ls -G --color=auto'
       alias music='setsid vlc >/dev/null 2>&1'
   fi

Script aliases
~~~~~~~~~~~~~~

You can call your scripts directly from the command line, but it is much more
convenient to give them aliases if you use them frequently.

Note how the Python scripts are called using p3, which is set earlier in
``.bashrc`` to equal ``python3``.

.. warning::

   Do not use an alias that is a Bash command or reserved word (e.g. ``sed``,
   ``done``) unless you truly want to override their build-in use.
   Doing so will cause frustrating errors that are difficult to debug.

.. code::

   # bash script aliases
   alias backup='~/scripts/bash/backup.sh'
   alias bump='~/scripts/bash/bump.sh'
   alias clean='~/scripts/bash/clean.sh'
   alias mygit='~/scripts/bash/mygit.sh'
   alias rackup='~/scripts/bash/rackup.sh'
   alias repocheck='~/scripts/bash/repocheck.sh'
   alias up='~/scripts/bash/up.sh'
   alias stable='~/scripts/bash/stable.sh'

   # python script aliases
   alias check='p3 ~/scripts/python/scripts/uptime.py'
   alias table='p3 ~/scripts/python/scripts/table.py'
   alias zen='p3 ~/code/python/dailyzen/dailyzen.py'

Scripting with Bash
~~~~~~~~~~~~~~~~~~~

-  Scripts are good for stringing a series of commands together or repeating
   the same commands multiple times.
-  Bash is Turing complete, but it isn't really a general purpose programming
   language. If you start finding things getting complicated, it is probably
   time to consider a fully-featured language like Python.
-  Of course, you can write scripts in many high-level programming languages as
   well. Python is a good example. But for automating tasks around your system
   most of the time Bash is quicker and easier to use than Python.

Bash > Python
~~~~~~~~~~~~~

As a very simple example, consider what is required to list the contents of
a directory. Using Bash is easier and faster.

**Bash**

.. code::

   $ ls
   conf.py  git-guide  images  index.rst  Makefile

**Python**

.. code::

   $ python
   >>> import os
   >>> os.listdir(os.getcwd())
   ['images', 'git-guide', 'Makefile', 'index.rst', 'conf.py']

Bash < Python
~~~~~~~~~~~~~

In this example, we fetch and parse some JSON from an online monitoring
service, then print the status of each monitor to the command line. While this
could be achieved with Bash, it is much easier to do with the logic structures
and libraries available in Python.

**Bash** - not going to try

**Python**

.. code::

   import json
   import logging
   import requests

   key = fetchkey()
   url = HOST + key + FORMAT
   try:
       r = requests.get(url)
       logging.debug('Content of request: ' + r.text)
   except Exception as e:
       logging.error(e)
       response = input('\nWebsite error\n')
       exit(0)
   logging.debug('Attempting to load json')
   data = (json.loads(r.text))
   for monitor in data['monitors']['monitor']:
       print(status_code[monitor['status']] + monitor['friendlyname'])

Updating master in a single repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``bump.sh`` is a simple script that wraps the commands required to fetch from
upstream, merge into master, then push to origin.

.. code::

   #!/bin/bash

   # Merges upstream into local branch for a Rackspace repository
   # and pushes the result to origin.

   git fetch upstream
   git merge upstream/master
   git push origin master

file names
   It is not required to use the ``.sh`` extension, but I prefer it so the file
   cannot be confused with another type of file.

shebang
   This line specifies the interpreter to use for running the script.

#
   This comments the rest of the line.


This script is aliased in ``.bashrc``:

.. code::

   alias bump='~/scripts/bash/bump.sh'

Thus, it can be run from the command line:

.. code::

   $ bump

Updating stable branches in a single repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``stable.sh`` iterates through a list of branch names, merging upstream into
each one and pushing it to origin.

This script introduces the concepts of arrays and for loops.

.. code::

   branches=(v10 v11 v12 v13)

   echo
   for item in ${branches[@]}; do
       git checkout $item
       git fetch upstream
       git merge upstream/$item
       git push origin $item
   done
   git checkout master
   git branch
   echo

Updating multiple repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``rackup.sh`` iterates through repository-containing directories in a single
directory and updates each one.

.. code::

   for dir in ~/rpcdocs/*; do
       if test -d $dir && test -e $dir/.git; then
           cd $dir
           git fetch upstream
           git merge upstream/master
           git push origin master
       fi
   done

Updating multiple directories with multiple repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``up.sh`` iterates through multiple directories, each containing multiple
repository-containing directories, and updates each one.

Note how this script calls other scripts using absolute paths.

.. code::

   div='======================'

   echo
   echo $div
   echo 'OpenStack Repositories'
   echo $div
   bash ~/scripts/bash/stack.sh
   echo

   echo $div
   echo 'Rackspace Repositories'
   echo $div
   bash ~/scripts/bash/rackup.sh
   echo

   echo $div
   echo 'My GitHub Repositories'
   echo $div
   bash ~/scripts/bash/mygit.sh
   echo

Checking the status of your repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``repocheck.sh`` is one of the scripts I call most often. It runs
``git status`` on all my repositories and tells me if I have uncommitted work
or if I'm on a non-master branch. I always like to run this before running
update scripts to prevent merge problems.

.. code::

   repos=(openstack rpcdocs code code/python scripts)

   echo
   for item in ${repos[@]}; do
       root=~/$item/*
       for dir in $root; do
           if test -d $dir && test -e $dir/.git; then
               cd $dir && echo $dir
               branch=$(git status -s -b)
               if ! [ "$branch" = "## master...origin/master" ]; then
                   git status -s -b
               fi
           fi
       done
   done
   echo

Cleaning your repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~

``clean.sh`` performs a ``git clean`` on all repositories. It runs
``repocheck.sh`` first and asks for confirmation to continue. This is because
it deletes uncommitted files.

.. warning::

   Destructive. This script deletes uncommitted files.

.. code::

   bash ~/scripts/bash/repocheck.sh
   echo -n "Proceed with git clean? (y/n): "
   read proceed
   if [ "$proceed" != "y" ]; then
       exit
   else
       echo "Cleaning git repos..."
   fi
   echo

   repos=(openstack rpcdocs code code/python scripts)

   for item in ${repos[@]}; do
       root=~/$item/*
       for dir in $root; do
           if test -d $dir && test -e $dir/.git; then
               if [ $dir == ~/rpcdocs/internal-docs-rpc ]; then
                   true
               else
                   cd $dir && echo $dir
                   git clean -xfd && git remote prune origin
               fi
           fi
       done
   done
   echo


Scripting other things
~~~~~~~~~~~~~~~~~~~~~~

Scripts can contain anything you can run from the command line, not just git
commands. For example, I use an aliased script to run backups for my Fedora
machine.

.. code::

   if [ "$1" = "all" ]; then
       sudo rsync -azvACHS --delete \
       --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/"} \
       --exclude={"/media/","/lost+found/"} /* \
       /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/
   else
       rsync -azvACHS --delete \
       --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/"} \
       --exclude={"/media/","/lost+found/",".gem/",".ICEauthority/"} \
       --exclude={".macromedia/",".pki/",".shutter/",".gimp-2.8/",".java/"} \
       --exclude={".mozilla/",".python_history/",".adobe/",".cache/"} \
       --exclude={".dropbox/",".gnome2/",".gnome2_private/",".novaclient/"} \
       --exclude={".thumbnails/",".bash_history/",".dropbox-dist/",".gnupg/"} \
       --exclude={".tox/",".bash_logout/",".esd_auth/",".gphoto/",".m2/"} \
       /home/bmoss/ \
       /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/home/bmoss/
   fi

In a former life, I needed to clean up a few hundred XML files. Perfect time
for a script.

.. code::

   # Removes whitespace between <screen> tags and swaps invalid characters for
   # valid XML codes.

   sed -i ':a;N;$!ba;s/[ \t]*<screen>\n/<screen>/g' $1
   sed -i ':a;N;$!ba;s/[ \t]*<screen>\t/<screen>/g' $1
   sed -i "s/\`/'/g" $1
   sed -i 's/C\&U/C\&amp\;U/g' $1
   sed -i 's/ \& / and /g' $1
   sed -i 's/ \#</ \&lt\;/g' $1

Tips
~~~~

Exit on error
   Add ``set -e`` to the top of your script in order to exit immediately if a
   command exits with a non-zero status.

   Cancel setting using ``set +e``.

Activate debugging
   Add ``set -x`` at the point you want to start debugging. This causes all
   commands being run to output to the command line.

   Cancel setting using ``set +x``.

Stringing together commands
   To execute commands in a series, separate with ``;`` or put each command
   on a newline.

   .. code::

      $ pwd; cat temp.rst; ls

      /home/scripts/doc
      cat: temp.rst: No such file or directory
      conf.py  git-guide  images  index.rst  Makefile

   Use ``&&`` if you want the line to stop if a command fails.

   .. code::

      $ pwd && cat temp.rst && ls

      /home/scripts/doc
      cat: temp.rst: No such file or directory

GitHub
   Use GitHub: it gives you practice and makes it easy to share your scripts
   between systems and with other people.

Document
   Always document your scripts! It is amazing how quickly you forget what
   a script does when you haven't used it in a while. Plus, if it is
   documented it is a lot easier to share it with other people.

Warning
~~~~~~~

Be very careful when scripting destructive commands. If you feel tempted to use
``-f``, think long and hard.

**BAD**

.. code::

   git push -f

   rm -rf

To some extent, this is mitigated when working in Git repositories as you can
almost always go back to a previous commit. You will, however, be sad if a
day's uncommitted work gets wiped out or you clobber someone else's branch
by force pushing to it.

Where to next
~~~~~~~~~~~~~

There are many online tutorials and old-school guides to using Bash. To be
honest though, I generally find it better to search for solutions to specific
problems. No one is a Bash programmer by trade, rather it is something you use
to get things done around your system.

So Google, use Stack Overflow, and cannibalize other people's work.

For better of for worse, my bash scripts are all on GitHub:

https://github.com/kallimachos/bash

Congratulations!
~~~~~~~~~~~~~~~~

You now know enough to be dangerous. Go forth and iterate!
