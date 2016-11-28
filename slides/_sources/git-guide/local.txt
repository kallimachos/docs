===========================
Working with Local Branches
===========================

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - git add *file*
     - adds the specified, untracked file to the index. Also used to update
       files to be committed after fixing merge conflicts.
   * - git commit -m "*message*" *file*
     - commits changes in the specified file or directory to the local
       repository
   * - git commit -a -m "*message*"
     - adds all changed files to the index and commits them to the local
       repository
   * - git commit --amend
     - amend the previous commit. Use to update a commit message, or to update
       a changed file in a commit before pushing.
   * - git stash
     - stashes current changes and sets branch to last commit. Useful for
       switching branches or pulling remote changes without having to commit
       local changes first.
   * - git stash apply
     - applies the changes stashed using the ``git stash`` command
   * - git branch
     - displays local branches
   * - git branch -a
     - displays all local and remote branches
   * - git branch *branch*
     - creates a new local branch with the specified name
   * - git checkout *branch*
     - checks out the specified local branch. If you checkout another branch
       without committing changes in the current branch, the uncommitted files
       will be copied to the new branch.
   * - git branch -d *branch*
     - deletes the specified local branch if it has been merged
   * - git branch -D *branch*
     - deletes the specified local branch regardless of its merge status
   * - git remote -v
     - lists current configured remotes for the fork
   * - git remote add upstream git\@github.com:*original_owner*/*original_repository*.git
     - specifies a new remote upstream repository that will be synced with the fork
   * - git remote update --prune
     - updates list of remote branches on the local machine


.. spelling::

   untracked
