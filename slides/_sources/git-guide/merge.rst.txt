================
Merging Branches
================

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - git cherry-pick *commit*
     - cherry-picks the specified commit to the current branch
   * - git merge *branch*
     - merges all commits from the specified branch into the current branch
   * - git rebase master
     - rebase your current branch using master
   * - git rebase -i master
     - interactively combines multiple commits into a single commit and rebases
       from master. ``pick`` the first commit listed, and enter ``squash`` for
       the rest.
   * - git rebase origin/master
     - rebase your current branch using origin/master
   * - git rebase -i origin/master
     - interactively combines multiple commits into a single commit and rebases
       from origin/master. ``pick`` the first commit listed, and enter
       ``squash`` for the rest.
