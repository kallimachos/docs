============================
PyConAu Brisbane August 2015
============================

OpenStack: A vision for the future
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Monty Taylor

- psychoanalytic thespia
- are we making a toolkit for people to use to develop clouds? Or to deploy
  clouds in various place?
- OS should provide computers and networks that work
- OS should not chase 12-factor apps; there are other, new tools that can do
  this (e.g. Kubernetes)
- OS should provide a happy home for app frameworks
- OS should, by default, give me a directly routable IP

Using PyCharm Educational Edition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Thea Koutsoukis

- PyCharm is an IDE

  - Syntax and error highlighting
  - code completion
  - version control integration
  - python console
  - free and open source
  - "fill in the missing code" projects (course creator plugin)
  - easy to pick up, but offers good IDE functionality as they progress
  - jetbrains.com/pycharm-educational

- suitable for school age kids
- courses

  - allows students to learn at their own pace
  - provides progress status and hints when the students make errors
  - warning: plan lessons before you start, as currently you can't change files
    around easily
  - no external file input, can't keep code, no reading and writing to files
  - good for very specific syntax and output

- can also function as a regular IDE that is student friendly

  - good error messages
  - syntax highlighting
  - code completion

- lesson plan idea

  - recap
  - teach class
  - do lessons
  - big project

- alternatives

  - online interpreters
  - useful because you don't have to install anything
  - may not have a great deal of features
  - rely on good internet connections
  - make not work on all browsers

Using Flask and Python Anywhere in the Classroom
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Brad Nielsen

- easier to work online than worrying about configuration in a BYOD school
- prefers Python because it is easier to get into than things like Java
- online environments are good because it lets the students try things they are
  interested in while the teacher functions as a mentor
- was looking for a python web server kids could program on both inside and
  outside the school network
- Flask and Django solve the same problems but Django can be more complex and
  restrictive
- pythonprogramming.net has some good Flask, Django, SQL, and other python
  learning resources
- Flask

  - easy to handle server requests, responses, and posted form data
  - easy to render dynamic content using the Jinja template library
  - easy to interact with a SQLite database without having to build database
    objects like Django
  - simple session handling

Orchestration and CI/CD with Ansible and OpenStack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Simone Soldateschi

- Rackspace devops guy
- CI pipeline to build container
- full stack
- orchestration
- service discovery
- CI pipeline go live
- Desired state: write code to tell systems how to manage themselves
- Full stack: hardware -> OpenStack -> CoreOS -> Docker

Trials & tribulations teaching Python at CoderDojo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Caleb Hattingh

- Short, complete programs
- better to start with something that works and let the students make changes
  from there than to give them something broken and ask them to fix it
- use these to launch discussions into real world computer and programming
  topics

Writing Python For Kids
~~~~~~~~~~~~~~~~~~~~~~~
Brendan Scott

- wrote Python for Kids for Dummies, published by Wiley
- publisher saw Brendan's blog and asked him to write a book
- took about 12 months from initial contact to publication
- only about a month of that was drafting the content

Open edX: An edX partner perspective
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
John Zornig

- edX is a non-profit, open-source Massive Open Online Course (MOOC) set up by
  Harvard and MIT in 2012
- edX code is available on GitHub
- UQ was one of the first universities to get involved with edX (UQx)
- primarily written in Python and Django
- edX.org is a SaaS based on open edX which is free but must be self-managed
  and hosted
- due to the number of universities involved, it can take a while to get pull
  requests merged to edX

OpenStack Works, so now what?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Monty Taylor

- as an app dev, I want to deploy and run an app on the internet so that my
  customers all over the world can consume it
- as an app dev, I want to deploy the application across multiple clouds so
  that my service survives issues in any one of them
- spin up and tear down 10-20k VMs on 3 clouds a day using only OS API
- 2000 devs work on OS, and every patch is integration tested twice before
  merging; 1.7 million test jobs in the last six months; 18 Terabytes of log
  data in six months
- each test runs on a single use cloud slave
- they run no hardware servers for these tests; everything is run on Rackspace
  and HP clouds
- Gerrit

  - traditional enterprise Java application (i.e. not particularly
    cloud-native)
  - run as a single Nova VM with a Cinder volume (which works well enough)
  - scale out farm of git replicas
  - 2500 changes every week
  - 15,000 change revisions every week
  - 10,000 new changes merged every 42 days

- nodepool

  - cloud native
  - purpose build in Python
  - keeps a pool of nodes ready to go so tests can be run immediately
  - tears down used nodes and creates new ones to replace them
  - multi-cloud
  - fully elastic -> responds to demand automatically

- All of this works, so what next? Make it easier!
- Basic things you want to do which are currently harder than they should be:

  - get (make/fetch/find) a base image
  - upload it to each cloud
  - boot a VM on one or more clouds
  - available on the internet

- Get a base image

  - OS diskimage-builder
  - packer
  - images from Ubuntu/RH/SUSE
  - problem: hypervisor image file format

    - Rackspace uses VHD
    - HP uses qcow2
    - DreamHost uses RAW

  - problem: image API version

    - HP uses v1
    - vechost uses v2

  - problem: image task vs. PUT
  - problem: ensure it's on the internet

    - there are a whole bunch of different combinations between vendors

- solutions:

  - ``os-client-config``
  - shade

    - a library to wrap business logic around client libraries
    - in use in infra nodepool and ansible (v2.0, multi-cloud support)

- Future directions:

  - get back to basics
  - shade existence is a bug
  - make some decision about divergences in the basic levels
  - take a stand even if one of our product managers disagrees
  - ensure that simple things are simple

Keynote: Consequences of an Insightful Algorithm
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Carina C. Zona

- algorithms impose consequences on people all the time

  - an algorithm is a step-by-step set of operations for predictably arriving
    at a given outcome
  - in CS = patterns of instructions articulated in code
  - in the world generally = patterns articulated in a variety of ways

- deep learning is a way of training artificial neural networks

  - relies on an automated discovery of patterns

- a false positive or false negative when dealing with human data must be dealt
  with very carefully

  - people cannot be treated simply as numbers

- standards for ethical research involving humans and human data tend to be
  only considered carefully in academia, but should be observed in other areas
  too.
- we cannot intuit inner state, emotions, private subjectivity
- consent is permission granted != informed consent is permission freely
  granted

  - 'no' is the consequence-free alternative and the default value with
    informed appreciation and understanding (ahead of time) of the consequences

- we need to learn from professional/academic ethics

  - avoid harm to others
  - consider the potential impact on others
  - be honest and trustworthy
  - actively counter bias and inequality
  - audit outcomes

- insightful algorithms are growing in precision but the risk of damage is also
  rising
- anticipate diverse ways to screw up

  - this requires truly diverse teams having decision authority

- cultivate informed consent
- audit constantly
- recognize bias is inherent
- visionary about countering bias
- aim mining tools at public benefit consequences

  - currently these are mostly aimed at corporate uses

- commit to transparency

Learn You a Flask
~~~~~~~~~~~~~~~~~
Lachlan Blackhall

- example of Flask app running on Heroku
- flask at the core doesn't provide much before serving requests
- further functionality is provided by plugins
- use an ORM, such as SQLAlCHEMY to access SQL database; don't use raw SQL

  - we're Python programmers, work high up the stack!

Easy wins with Cython: fast and multi-core
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Caleb Hattingh

- Cython lets you specify object/variable types to save time as Python doesn't
  have to determine type
- Cython is a super set of Python; it can compile anything written in Python
  into a C file
- easycython is a useful wrapper to help with cython code
- it speeds up Python code significantly when crunching large amounts of data

  - can be applied just to the bits of the code that need speeding up, the
    rest can just be standard python

- PyPy and Numba are both options for speeding up Python code as well
- Cython can be run multi-core (with no global interpreter lock)
- but limit your Cython to only the bit that really need it, as it adds some
  complexity and debugging difficulties

Rapid prototyping with teenagers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Katie Bell

- NCSS program
- also run a summer school (has been running for 20 years)

  - 2.5 days of teaching python
  - 3 days of project time, with an all-nighter on the last night

- three things excite kids for learning:

  - How stuff works
  - Building cool stuff
  - Problem solving

- goal of the project was to build a completely functioning social networking
  site
- build a site quickly with minimal magic
- used tornado for building the web page, but tornado can look a bit
  complicated so they built a wrapper and let the kids use that
- sqlite for persistent data as it is relatively simple and built into Python
- use simple tools
- group brainstorm only at the beginning
- use version control
- communication is paramount
- continual integration -> always have something working, have students demo
  often
- explain new procedures to the whole class at the same time
- share successes

On Being Pythonic
~~~~~~~~~~~~~~~~~
Peter Lovett


.. spelling::

   thespia
   Kubernetes
   routable
   Koutsoukis
   jetbrains
   pythonprogramming
   Jinja
   Soldateschi
   Hattingh
   edX
   Zornig
   UQx
   Terabytes
   nodepool
   diskimage
   vechost
   nodepool
   Zona
   Lachlan
   Blackhall
   Hattingh
   easycython
   Numba
   nighter
   Lovett
