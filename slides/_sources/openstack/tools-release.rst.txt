===============
Releasing tools
===============

The ``openstackdocstheme``, ``openstack-doc-tools``, and
``os-api-ref`` repositories need to be released as packages to the
`Python Packaging Index <http://pypi.python.org>`__.

The release is done by the OpenStack release team but needs to be triggered by
the documentation team. For details, see `Release management
<https://docs.openstack.org/project-team-guide/release-management.html#how-to-release>`__.
For details on the steps required to trigger a release, see the
openstack/releases `README
<https://github.com/openstack/releases/blob/master/README.rst>`__ file.

Triggering a release
~~~~~~~~~~~~~~~~~~~~

#. Clone the `openstack/release
   <https://review.openstack.org/#/admin/projects/openstack/releases>`_
   repository and create a local working branch.

#. Edit the YAML file for the repository you want to release:

   openstackdocstheme
      ``deliverables/_independent/openstackdocstheme.yaml``

   openstack-doc-tools
      ``deliverables/_independent/openstack-doc-tools.yaml``

   os-api-ref
      ``deliverables/_independent/os-api-ref.yaml``

#. Add an entry for the new release, using the previous release as a template.

   - Update the version number using `semantic versioning
     <http://semver.org/>`_.

   - Update the commit hash to the latest commit you want included in the
     release.

   - Update the highlights field with important changes. If the release
     contains only minor fixes, you can remove the highlights entry.

   **Example:**

   .. code-block:: yaml

      - version: 1.6.1
      projects:
        - repo: openstack/openstackdocstheme
          hash: 58823b338cbeffeacce5b524269a5e6f194bbce9
          highlights: >
            Adds a checklist to the doc bug template.

#. Commit your changes, stating the package name release number in the commit
   subject line:

   .. code-block:: console

      $ git commit -a -m 'Release openstackdocstheme 1.6.1'

#. Push your patch for review:

   .. code-block:: console

      $ git review
