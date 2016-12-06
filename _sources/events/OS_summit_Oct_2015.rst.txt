===================================
OpenStack Summit Tokyo October 2015
===================================

Tuesday Oct 27, 2015
~~~~~~~~~~~~~~~~~~~~

Keynote
-------
Johnathan Bryce (Executive Director, OpenStack Foundation)

- Certified OpenStack Administrator course
- Egle Sigler (Principal Architect, Rackspace)
- OpenStack navigator for tracking and displaying information about various
  OpenStack components (openstack.org/software)
- Lachlan Evenson (Cloud Platform Engineering Team Lead, Lithium Technologies)

  - container stuff, Crocodile hunter game

- Takuya Ito (Sr. Manager of Infra Engineering and OpenStack Blackbelt,
  Yahoo! Japan)

  - 64.99 billion page views per month
  - 31.9 billion are from mobile devices
  - 270 million apps downloaded
  - 100+ services
  - running 50000+ instances on OS
  - 20 PB data storage
  - 6 times traffic density compared to physical environment
  - 20+ clusters
  - they've doubled OS use in the last year
  - experience massive spikes when certain events (e.g. natural disaster) take
    place
  - mission critical workloads are run on OS
  - it is very important to have consistent APIs (i.e. OpenStack), so that the
    underlying hardware doesn't matter

- Tsugikazu Shibata (OpenStack Foundation Board member, NEC)
- Erica Brescia (COO, Bitnami)

  - How to Banish the Shadow Cloud
  - provide easy-to-use, complete solutions for users

OpenStack I18n team
-------------------
Daisy (Ying Chun Guo), Carlos Munoz (Red Hat Zanata Dev Lead),
KATO Tomoyuki (Sales Engineer, Fujitsu)

- translate code, documentation, community collaboration (wikis, etc.),
  promotional material (website, emails, etc.)
- 14 languages translated for dashboard
- 6 languages translated for docs
- 10 languages for user messages of 9 projects
- Carlos Munoz

  - Zanata is now the official translation platform for OS
  - upcoming improvements in glossary translation, per-project permissions,
    statistics, request management

- Kato Tomoyuki

  - Zanata demo
  - similar strings are presented by the tool, so you can copy them if useful

Ops Liberty Issues
------------------

- https://etherpad.openstack.org/p/TYO-ops-major-liberty-issues
- Rackspace public cloud is viewed as a benchmark for adoption of new OpenStack
  versions
- nova Liberty release notes are apparently awesome
- Kilo release notes were poor; new buggy features were on by default and not
  mentioned in release notes
- conclusion: Release Notes are very important to ops and decisions to
  upgrades; they should be given closer attention
  and need more involvement from projects so they are accurate
- suggestion that we update Release Notes following mid-cycle meetups (nova has
  done this once before)
- upgrades are a key concern; solid docs for updating each service is very
  important
- we are lacking database migration docs

Docs Cross Project Workshop
---------------------------

- Cloud Admin and Admin User Guides

  - maintain split? combine?
  - Publish user-task matrix for OpenStack

- Networking Guide

  - this is useful, but people want more

- Many projects are BYOW: Bring Your Own Writer
- Packaging

  - Fedora packing will be essentially nightly builds

Automated OpenStack Deployment: A Comparison
--------------------------------------------
Florian Haas (Principal Consultant, hastexo)

- the room was full, but this would be worth watching online later

Upgrading OpenStack Without Breaking Everything (Including Neutron!)
--------------------------------------------------------------------
Sean Lynn (Principal Engineer, OpenStack DevOps, TWC) and Clayton O'Neill
(Principal Engineer, Time Warner Cable)

- Automate everything - they use Ansible to drive Puppet
- Keep up (upgrade every 6 months)
- track AMQP heartbeats
- Requirements

  - API outage is ok
  - no compute outage
  - no storage outage
  - no network outage

- Consider time of day when upgrade occurs
- test production data from all regions
- test network impact
- add load to the dev/staging environments
- shut down services in such a manner that no Juno services are trying to talk
  to Kilo services
- change to configuration for nova and cinder was not well documented
- Juno deprecations were not documented as removed in the Kilo Release Notes
- a new Kilo default was not documented in the Release Notes
- new features were not always well documented


.. spelling::

   Egle
   Sigler
   Lachlan
   Evenson
   Takuya
   Blackbelt
   Tsugikazu
   Shibata
   Brescia
   Bitnami
   Ying
   Chun
   Guo
   wikis
   Kato
   Tomoyuki
   meetups
   hastexo
