======================================================
Bash for gits: A Bash scripting tutorial for Git users
======================================================

.. ifnotslides::

   `View slide presentation
   <http://kallimachos.github.io/docs/slides/talks/bash-for-gits.html#1>`_

.. ifslides::

   .. rst-class:: title-image

      .. figure:: ../images/bash-logo.png

Introduction
~~~~~~~~~~~~

-  This tutorial assumes you are familiar with running commands in a Bash
   shell.

.. rst-class:: build

-  It is not a systematic introduction, but is about giving you an idea
   of how Bash scripting can help with your work flow.

.. rst-class:: build

-  Mac and Linux bash shells have a few minor differences; we'll see
   some examples when we look at my **.bashrc** file.

.. rst-class:: build

-  Windows 10 now supports Bash using a Linux subsystem, but it is not
   built-in. Still, the concepts presented here apply to the Windows command
   line, even if the syntax does not.

.bashrc
~~~~~~~

-  **.bashrc** is executed when you open a Bash terminal. It is useful for
   setting certain configuration options and creating aliases.

.. rst-class:: build

-  Usually located at **~/.bashrc**. If this file does not exist, you can
   create it.

.. rst-class:: build

-  You may need to add the following code at the top of your
   **~/.bash_profile** in order to read **.bashrc**:

   .. code-block:: bash

      # Get aliases and functions
      if [ -f ~/.bashrc ]; then
          . ~/.bashrc
      fi

.. rst-class:: build

-  If you make a change to **.bashrc**, you must either open a new terminal or
   run ``source .bashrc`` in order for the changes to take effect.

.. nextslide::

In this example, we configure the prompt, add an application to the PATH, and
create some aliases.

Note that the ``#`` symbol indicates a comment.

.. code-block:: bash

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

Because **.bashrc** is executed, it can include arbitrary code.

In this example, an ``if`` clause is used to set aliases depending on the
operating system.

.. code-block:: bash

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

.. code-block:: bash

   # bash script aliases
   alias backup='~/scripts/bash/backup.sh'
   alias bump='~/scripts/bash/bump.sh'
   alias clean='~/scripts/bash/clean.sh'
   alias mygit='~/scripts/bash/mygit.sh'
   alias rackup='~/scripts/bash/rackup.sh'
   alias repocheck='~/scripts/bash/repocheck.sh'
   alias up='~/scripts/bash/up.sh'
   alias stable='~/scripts/bash/stable.sh'

.. warning::

   Do not use an alias that is an existing command or reserved word (e.g.
   ``sed``, ``done``) unless you truly want to override their built-in use.
   Doing so is likely to cause frustrating errors that are difficult to debug.

Scripting with Bash
~~~~~~~~~~~~~~~~~~~

-  Scripts are good for stringing a series of commands together or repeating
   the same commands multiple times.

.. rst-class:: build

-  Bash is Turing complete, but it isn't really a general purpose programming
   language. If you start finding things getting complicated, it is probably
   time to consider a fully-featured language like Python.

.. rst-class:: build

-  Of course, you can write scripts in many high-level programming languages as
   well. For automating tasks around your system, however, Bash is often
   quicker and easier.

Bash > Python
~~~~~~~~~~~~~

As a very simple example, consider what is required to list the contents of
a directory.

**Bash**

.. code::

   $ ls
   conf.py  git-guide  images  index.rst  Makefile

|

**Python**

.. code::

   $ python3
   >>> import os
   >>> for file in os.listdir():
   ...     print(file, end="  ")
   conf.py  git-guide  images  index.rst  Makefile

Bash < Python
~~~~~~~~~~~~~

In this example, we fetch and parse some JSON from an online monitoring
service, then print the status of each monitor to the command line. While this
could be achieved with Bash, it is easier to do with the syntax and libraries
available in Python.

**Python**

.. code:: python

   import json
   import requests

   url = 'http://api.uptimerobot.com/getMonitors?apikey=12345'

   try:
       r = requests.get(url)
   except Exception as e:
       print('Error: ' + e)
       exit(1)
   data = (json.loads(r.text))
   for monitor in data['monitors']['monitor']:
       print(status_code[monitor['status']] + monitor['friendlyname'])

Updating master in a single repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**bump.sh** wraps the commands required to fetch from upstream, merge into
master, then push to origin.

.. code-block:: bash

   #!/bin/bash

   # Merges upstream into local branch for a Rackspace repository
   # and pushes the result to origin.

   git fetch upstream
   git merge upstream/master
   git push origin master

.. rst-class:: build

-  **file names** - you to not have to use **.sh**, but extensions are
   helpful for minimizing confusion and easier globbing (``*.sh``).

-  **shebang** (``#!/bin/bash``) - this line specifies the interpreter to use
   for running the script.

-  ``#`` - the hash symbol comments the text to its right.

.. nextslide::

**Running the script**

#. Make the script executable:

   .. code::

      $ chmod +x ~/scripts/bash/bump.sh

.. rst-class:: build

2. Alias in **.bashrc**:

   .. code-block:: bash

      alias bump='~/scripts/bash/bump.sh'

3. Run from the command line when you are in an appropriate directory:

   .. code::

      $ cd docs-rpc
      $ bump

Updating stable branches in a single repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**stable.sh** iterates through a list of branch names, merging upstream into
each one and pushing them to origin.

This script uses a ``for`` loop to iterate through an array (i.e. list of
values).

The ``$`` symbol indicates that you want to access the value of a variable.

.. code-block:: bash

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

**rackup.sh** iterates through repository-containing directories in a single
directory and updates each one.

.. code-block:: bash

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

**up.sh** iterates through multiple directories, each containing multiple
repository-containing directories, and updates each one.

Note how this script calls other scripts.

.. code-block:: bash

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

Checking the status of your repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**repocheck.sh** is one of the scripts I use most often. It runs
``git status`` on all my repositories and tells me if I have uncommitted work
or if I'm on a non-master branch. I always like to run this before running
update scripts to prevent merge problems.

.. code-block:: bash

   repos=(openstack rpcdocs code code/python scripts)

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

Cleaning your repositories
~~~~~~~~~~~~~~~~~~~~~~~~~~

**clean.sh** performs a ``git clean`` on all repositories. It runs
**repocheck.sh** first and asks for confirmation to continue. This is because
it deletes uncommitted files.

.. warning::

   Destructive. This script deletes uncommitted files.

.. nextslide::

.. code-block:: bash

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
           cd $dir && echo $dir
           git clean -xfd && git remote prune origin
       done
   done
   echo


Scripting other things
~~~~~~~~~~~~~~~~~~~~~~

Scripts can contain anything you can run from the command line, not just git
commands. For example, this script uses ``rsync`` to backup a computer running
Fedora:

.. code-block:: bash

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

.. nextslide::

Making identical changes to a large number of files is perfect for scripting:

.. code-block:: bash

   sed -i ':a;N;$!ba;s/[ \t]*<screen>\n/<screen>/g' $1
   sed -i ':a;N;$!ba;s/[ \t]*<screen>\t/<screen>/g' $1
   sed -i "s/\`/'/g" $1
   sed -i 's/C\&U/C\&amp\;U/g' $1
   sed -i 's/ \& / and /g' $1
   sed -i 's/ \#</ \&lt\;/g' $1

Stringing together commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~
-  To execute commands in a series, separate with ``;`` or put each command
   on a newline.

   .. code::

      $ cat temp.rst; ls
      cat: temp.rst: No such file or directory
      conf.py  git-guide  images  index.rst  Makefile

.. rst-class:: build

   -  Use ``&&`` if you want the line to stop when a command fails.

      .. code::

         $ cat temp.rst && ls
         cat: temp.rst: No such file or directory


   -  Use ``|`` to pipe the output of one command to another command.

      .. code::

         $ ls | wc
         12    12    105

Tips
~~~~

**Exit on error**

-  Add ``set -e`` to the top of your script in order to exit immediately if a
   command exits with a non-zero status.
-  Cancel using ``set +e``.

.. rst-class:: build

   **Debugging**

   -  Add ``set -x`` at the point you want to start debugging.
   -  Cancel using ``set +x``.

   **GitHub**

   -  Keep your code in version control. It gives you practice and makes it
      easier to share your scripts between systems and with other people.

   **Document**

   -  Comment your scripts so you know what they do and how they work. Sharing
      is easier with documentation!

Warning
~~~~~~~

**Be very careful when scripting destructive commands.** Iterating through
directories and changing or deleting files is an easy way to cause problems.
Test your script several times on dummy files before using in production.

Be especially careful if you feel tempted to use the force; it leads to the
dark side.

**BAD**

.. code::

   git push -f

   rm -rf

To some extent, the risks of running destructive commands are mitigated when
working in Git repositories as you can almost always go back to a previous
commit. You will be sad, however, if a day's uncommitted work gets wiped out or
you clobber someone else's branch by force pushing to it.

Where to next
~~~~~~~~~~~~~

There are many online tutorials and old-school guides to using Bash. To be
honest though, I generally find it better to search for solutions to specific
problems. No one is a Bash programmer by trade; it is something you use to get
things done around your system.

So Google, use Stack Overflow, and cannibalize other people's work.

For better of for worse, my bash scripts and **.bashrc** file are all on
GitHub:

- https://github.com/kallimachos/bash

.. ifslides::

   This tutorial is also available for reference:

   - http://kallimachos.github.io/docs/talks/bash-for-gits.html

Congratulations!
~~~~~~~~~~~~~~~~

You now know enough to be dangerous. Go forth and iterate!
