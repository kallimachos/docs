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
   * - git push origin *branch1*:*branch2*
     - creates a remote branch *branch2* and pushes the local branch *branch1*
       to it
   * - git push origin :*branch*
     - deletes the specified remote branch (note there is a space between
       ``origin`` and ``:branch``)
   * - git reset --hard origin/*branch*
     - resets the checked-out local branch to the status of the specified
       remote branch; running ``git fetch origin`` first is recommended


Troubleshooting
~~~~~~~~~~~~~~~

To reset origin remote to upstream remote, run the following commands:

   .. prompt:: bash

      git remote update
      git reset --hard upstream/master --
      git push origin +master

The double hyphen ensures that ``upstream/master`` is considered as a revision
and not confused as a path.
