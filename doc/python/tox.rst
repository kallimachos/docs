===
Tox
===

Tips and tricks for using `tox <https://tox.readthedocs.io/en/latest/>`_.


Testing in-development packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Test local, in-development packages using tox's ``distshare`` feature:

#. Run ``tox`` for the development package. Ensure sdist builds are enabled in
   **tox.ini**:

   .. code::

      skipsdist = False

   or

   .. code::

      # skipdist = True

#. The package's sdist file is now available in *~/.tox/distshare/*. You can
   use this file as a dependency by forcing two pip runs in **tox.ini**:


   .. code::

      deps=
          {distshare}/packagename*.zip
      commands=
          pip install -qr{toxinidir}/requirements.txt
