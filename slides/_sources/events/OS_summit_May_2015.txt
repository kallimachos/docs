===================================
OpenStack Summit Vancouver May 2015
===================================

Wednesday May 20, 2015
~~~~~~~~~~~~~~~~~~~~~~

OpenStack Infrastructure Management with ManageIQ - John Hardy (Red Hat)
------------------------------------------------------------------------
- apparently they have 5 docs writers and bundles of docs; John specifically
  called this out
- it would seem that having good docs in an upstream project is a selling point
- currently, ManageIQ is being used to migrate thousands of VMs from virtual
  environments, e.g. VMware, to OpenStack environments in a batch processing
  mode
- Inventory is the key feature of ManageIQ, as it enables the admin to see into
  every aspect of their infrastructure and control it based on a large number
  of different metrics


OpenStack Docs RST Conversion - Lana Brindley (Rackspace)
---------------------------------------------------------
- UG SG will focus on converting the Cloud Admin Guide to RST
- in the meantime, the rest of the community will focus on converting the
  Install Guide
- the Install Guide will focus on the core components only
- should the upgrade stuff from the Ops Guide go into one of the Admin guides?
- perhaps our audience analysis should be published to the docs convention wiki
  (my thought)


OpenStack Ops Doc Work Session
------------------------------
- use cases should guide our ops documentation
- still lots of confusion over what the roles are between operator,
  administrator, and user
- perhaps the distinction between operator and administrator is not real-world
  for many use cases
- Installation Guide is really an Installation Training Guide
- clarity over which guide contains which information
- prerequisites at start (to start this guide you should have done this, be
  familiar with this)
- next steps at end (see this guide for the next things you can do)
- describe the current book and the other books at the top of each book so
  people know where they are and if they are in the correct place


Thursday May 21, 2015
~~~~~~~~~~~~~~~~~~~~~

Docs API Working Session
------------------------
- currently in WADL, but this is not very good
- considering alternatives for conversion
- Swagger is open and useful, but development/support may not be mature
- RAML is in a decent place, but all the tools are proprietary


Docs Liberty Blueprint Working Session
--------------------------------------
- Networking Guide needs to get finished
- Anne things the Admin User Guide should disappear, with its content split
  between the Cloud Admin Guide and the End User Guide. Those two guide could
  then probably be renamed to just Admin Guide and User Guide.
- Lana wants to start closing old, irrelevant bugs. Basically she wants to
  clean up the backlog.


Docs Team Structure Fishbowl Session
------------------------------------
- lots of old, irrelevant bugs that need to be closed
- lots of assigned bugs that aren't being worked on
- DocImpact is a problem

  - subscribe the person who submitted the code patch -> automated?
  - maybe get rid of DocImpact entirely?
  - can we get the submitter to write the doc?
  - no docs no merge?

- Reviewing

  - Review Guide should be better propagated
  - perhaps add a section to the Review Guide telling first time committers
    what they can expect during reviews

- Edit How To and How To for First Timers -> add in an example commit message,
  tell them to join the `OpenStack Docs team
  <http://docs.openstack.org/contributor-guide/quickstart.html>`_,
  put a link to the review guidelines at the top of the page, next to the How
  To links

  - Rewrite the documentation How To, resulting in a good, easy-to-read and
    working getting started guide (Note: Avoid duplication with infra-manual)

- Making core

  - how this happens needs some thought
  - every 3 months based on numbers, but current core can nominate and vote on
    others with good reason
  - it would be helpful if core were globally distributed and they were fully
    active

- New contributors

  - tutorial for contributing where writers can work in a sandbox = smaller
    repository to download, changes don't matter
  - make a 5 minute video

- Encouraging technical content for specialty guides
  - each dev team should have a docs liaison


Docs Information Architecture
-----------------------------
- Audiences are not clear!
- Operations Guides

  - widely loved
  - ToC works well
  - slightly out of date
  - not a reference, not comprehensive; this is a starting point for
    admins/operators

- Arch Guide

  - needs heavy editing
  - backwards/bottom-up - goes from heavy specific info to examples


Post-summit tasks
~~~~~~~~~~~~~~~~~

- Move Hot Guide from End User Guide to Heat repository
- Convert Cloud Admin Guide to RST
- Restructure Cloud Admin Guide, Admin User Guide, and End User Guide. End
  result should be an Admin Guide and a User Guide
- Upgrade material from the Ops Guide might fit better in the Admin guide
- Bug list curation
- Update review guide on wiki
- Update How To and How To for First Timers on wiki; make the latter a tutorial
  that works with a sandbox repository for trying out the tools

  - talk to Amanda about this, and run plans past Lana before making big
    changes
  - include a section on Git rebasing
  - instructions should tell us to clone from git.openstack.org or GitHub;
    right now it is inconsistent

- For each book where it makes sense:

  - prerequisites at start (to start this guide you should have done this, be
    familiar with this)
  - next steps at end (see this guide for the next things you can do)
  - describe the current book and the other books at the top of each book so
    people know where they are and if they are in the correct place

- Arch Guide needs IA and heavy editing; what can be done at the swarm and what
  should be done beforehand?  Alex sent email to Shilah (Ops and Arch doc team
  lead) and Deon about IA before the swarm.

Notes
~~~~~
- Russell Sim at Aptira for rendering RST
- Move Hot Guide from End User Guide to Heat repository
- https://github.com/GaretJax/sphinx-autobuild


.. spelling::

   committers
   ToC
   curation
   Shilah
   Aptira
