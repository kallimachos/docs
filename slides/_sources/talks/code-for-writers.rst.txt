==========================================
Software Development for Technical Writing
==========================================

The writer's guide to writing code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Some advice based on my experience as a tech writer with no software
development training.

.. warning::

   I am going to show some examples from my own code. Developers with
   delicate sensibilities should look away. At the same time, if you are an
   experienced developer, my examples might give you an idea of the kinds of
   things that writers find useful in their work.

- Give it a go. Struggling to get things working is the best way to learn. It
  is empowering to solve your own problems with code, and writers don't always
  have access to a developer.
- Do have some formal introduction to coding. Many free courses are available
  online that can get you far enough to start experimenting on your own.
- automating little things on your own system is a good place to start
- even if someone else runs your infrastructure, try to understand as much of
  it as you can. Knowledge is power and it is very useful if you can fix things
  when they break.
- I know I'm preaching to the choir, but document as you go and for a user that
  doesn't know the work
- gather requirements before you begin
- think about how you want to organize scripts/code on your system; changing
  later is hard. But if you do need to change, go for it.
- work on a branch, not on production, and always be able to roll back
- code with reuse in mind and structure your work with an eye to future changes
- code consistently; look to upstream style guides (this applies to docs too;
  don't waste time writing and maintaining an entire guide that when you can
  adopt one and add your own bits to it)
- contribute upstream; avoid bespoke solutions when possible (don't just help
  yourself, help everyone)
- get approval from TPB and consensus from your colleagues for changes that
  affect work flow (e.g. adding a bolditalic feature is fine, you can advertise
  it after. Changing the structure of a repo or an html theme requires some
  warning.)
- Google, Stack Overflow, and docs are your friends. Plus, consuming tech docs
  improves your own writing no end. You might even find a new project to
  contribute to.
- simplify as much as possible: stick to one language, framework, CI/CD tool,
  etc. Unless your company has mandated products that they buy for you, I
  strongly recommend free and open source software. Most documentation will
  come nowhere close to outgrowing free-tier tools.
- learn Bash scripting and understand how your version control system works;
  run through some sample bash scripts that I use to automate simple repetitive
  things (e.g. up and repocheck)
- get a GitHub account
- learn how to run basic tests on your code (and for that matter, your docs).
  Testing before deployment is very useful; try to enable local builds that are
  identical to CI builds.
- search for other solutions before you start coding; there's a reasonable
  chance someone else has had the same problem. Then borrow as much as you can;
  there's no point reinventing the wheel. Look for ideas and solutions in
  established projects.
- https://dev.to/edemkumodzi/why-i-became-a-software-engineer
- Ask what your computer can do for you, not what you can do for your computer.
