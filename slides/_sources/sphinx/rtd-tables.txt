==============================================
Table width fix for Read the Docs Sphinx theme
==============================================

The **Read the Docs** Sphinx theme contains a bug that causes text in table
cells not to wrap. This results in very wide tables with horizontal scroll
bars.

You can workaround this issue by defining a custom CCS override file.

#. Change into your documentation directory. This is usually where
   the ``index.rst`` and ``conf.py`` files are located:

   .. prompt:: bash

      cd doc

#. If it does not already exist, create a ``_static`` directory:

   .. prompt:: bash

      mkdir _static

#. Create a ``theme_overrides.css`` file in the ``_static`` directory:

   .. prompt:: bash

      touch _static/theme_overrides.css

#. Open the ``theme_overrides.css`` file and add the following CSS:

   .. code::

      /* override table width restrictions */
      @media screen and (min-width: 767px) {

         .wy-table-responsive table td {
            /* !important prevents the common CSS stylesheets from overriding
               this as on RTD they are loaded after this stylesheet */
            white-space: normal !important;
         }

         .wy-table-responsive {
            overflow: visible !important;
         }
      }

#. Open the ``conf.py`` file and add the following configuration options:

   .. code::

      html_static_path = ['_static']

      html_context = {
          'css_files': [
              '_static/theme_overrides.css',  # override wide tables in RTD theme
              ],
           }

#. Build your documentation using Sphinx and check the tables; cells should
   now wrap correctly.
