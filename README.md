cloaked-bear
============

Playing with Travis-CI, Behat and Drush make.

This project intends to become a base for using travis CI and acceptance
testing on Drupal site projects. Fork it, add your modules, profiles, themes,
etc. to the Drush make file and enable your repo on travis-ci.org (or
eventually travis-ci.com for private repos). You can then build your site and
write Behat tests (in any order) and thereafter, commits and pull requests to
your project will be automatically tested against your feature files by Travis
CI.

No custom code should go in this repo, it's strictly a site and has only
acceptance tests. Eventually I'll make a version for custom modules that also
runs any simpletests you may have written. See below.

Future
======

I intend to use DrupalExtension once it's mature enough to be useful. This
project may even be a good starting point for developing and testing it
(Through a process of incrementally implementing features in this repo with
tests and adding any useful generic step definitions to DrupalExtension).

I intend to create similar repos designed to become an installation profile or
(set of) custom module(s) those will use Simpletest instead of or in addition to
 Behat for testing.

I may add commented-out examples of how to run the simpletests for any contrib
projects' code which this project includes patches for. It remains to be
determined if that's within the scope of this project.


System Dependencies
===================

This installs drupal to a SQLite DB, uses Drush's runserver command to run the
site and Zombie.js to run Javascript tests and so we need (in addition to Drupal
dependencies):

* php5-cgi
* nodejs
* npm

On a modern Ubuntu (and probably any modern Debian):

    sudo apt-get install php5-cgi php5-curl php5-gd php5-sqlite libgd2-xpm npm

Local Dependencies
==================

The rest of setup is managed by npm (package.json) and composer (composer.json).

First, get composer:

    curl -s https://getcomposer.org/installer | php

Then install deps:

    npm install
    php composer.phar install

Then add local binaries and node modules to your environment:

    export PATH=$PATH:$PWD/vendor/bin
    export NODE_PATH=$NODE_PATH:$PWD/node_modules


Building, Installing and Running the Site
=========================================

All via the awesome that is Drush:

    drush make drush.make drupal
    drush -r $PWD/drupal site-install --db-url=sqlite://db.sqlite
    drush -r $PWD/drupal runserver


Testing
=======

Behat local config is in the default location (imports behat.base.yml):

    behat
