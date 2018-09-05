============================
Working with Remote Branches
============================

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - git checkout --track origin/*branch*
     - creates and checks out a local tracking branch for the specified remote
       branch
   * - git fetch origin
     - fetches the remote repository and stores it locally, but does not merge
       it with the current branch
   * - git pull
     - fetches and merges the remote repository with the local repository
   * - git pull origin *branch*
     - fetches and merges the specified remote branch with the current local
       branch
   * - git push
     - pushes all committed changes on all branches to the remote repo
   * - git push -f
     - force pushes all committed changes on all branches to the remote repo.
       **Warning:** this can overwrite commits on the remote branches.
   * - git push origin +\ *branch*
     - force pushes committed changes on the specified branch.
       **Warning:** this can overwrite commits on the remote branch.
   * - git push origin *branch1*:*branch2*
     - creates a remote *branch2* and pushes the local *branch1* to it
   * - git push origin :*branch*
     - deletes the specified remote branch (note there is a space between
       ``origin`` and ``:branch``)
   * - git reset --hard origin/*branch*
     - resets the checked-out local branch to the status of the specified
       remote branch; running ``git fetch origin`` first is recommended


Configuring an upstream remote for a fork
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. List the current configured remote repository for your fork:

   .. code::

      git remote -v
      origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
      origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)

2. Specify a new remote upstream repository that will be synced with the fork:

   .. code::

      git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

3. Verify the new upstream repository you've specified for your fork:

   .. code::

      git remote -v
      origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
      origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
      upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
      upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)


Adding commits to a pull request
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the following formula to add commits to another person's pull request:

.. code::

   git push git@github.com:<user>/<repo> <local_branch_name>:<remote_branch_name>


Troubleshooting
~~~~~~~~~~~~~~~

To reset origin remote to upstream remote, run the following commands:

   .. prompt:: bash

      git remote update
      git reset --hard upstream/master --
      git push origin +master

The double hyphen ensures that ``upstream/master`` is considered as a revision
and not confused as a path.
