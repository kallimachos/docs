==========
Kubernetes
==========

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - kubectl -n cake logs -l 'release=kbdash'
     - view the logs for the latest build


Deis
~~~~

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - deis config:push
     - push the current config from a ``.env`` file
   * - git push deis master
     - push the current branch to ``deis/master``. Often best to
       add ``--force``.
