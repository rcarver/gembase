# GEMBASE

A basic structure for ruby gems. To setup a new project, run:

    mkdir myproject
    cd myproject

    curl -sLS https://github.com/rcarver/gembase/raw/master/init.sh | sh

You can also use this to convert an existing project. The script will
overwrite any existing files, but git will show you the diff.

## Conformance

gembase projects conform to the following rules:

### File structure

* README.md exists
* CHANGELOG.md is formatted as `git-changelog` would do it (`brew
  install git-extras`)
* lib/project.rb exists
* lib/project/version.rb contains a `VERSION` constant
* project.gemspec exists
* Gemfile contains "gemspec", such that dependencies are defined in
  project.gemspec
* Gemfile.lock is in .gitignore

### Rake tasks

* `rake` runs the full test suite
* `rake run` runs a server if applicable
* `rake release` ensures an up-to-date gemspec and CHANGELOG, sets 
  a git tag based on `VERSION` (a rubyforge project is not assumed).
  and pushes those changes.

## Rakefile.base

Rakefile.base defines most tasks for you. At the minimum, your Rakefile
should look something like this:

    load 'Rakefile.base'

    task :default => :test

    # define :test task and whatever else you want.


