=====
Twine
=====

Run the following commands to build a Python package and upload to `PyPI <https://pypi.org/>`_ with
`twine <https://twine.readthedocs.io/en/latest/#>`_.


.. prompt:: bash

   python setup.py sdist bdist_wheel
   twine upload dist/*
