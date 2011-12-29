# GEMBASE

A basic structure for ruby gems. To setup a new project, run:

    mkdir myproject
    cd myproject

    curl -sLS https://raw.github.com/rcarver/gembase/master/init.sh | sh

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

### Releasing gems

Gembase makes it trivial to tag and release new versions of your code. A release here
simply means a tagged version at GitHub, along with information in the CHANGELOGE.md.

**Please note that at this time Gembase does not push anything to rubygems** This could
be added but must not be a requirement for Gembase conformance.

To release

1. Ensure that the code you wish to release is on the `master` branch.
2. Update the VERSION string, found in `lib/PROJECTNAME/version.rb`
3. Run `rake release`. The changelog will open for editing in your $EDITOR. Make any necessary changes
   (typically set the version number and edit the commit messages), then save and close the file.
4. That's it. Gembase will tag and push a commit including the VERSION and CHANGELOG changes.

## Rakefile.base

Rakefile.base defines most tasks for you. At the minimum, your Rakefile
should look something like this:

    load 'Rakefile.base'

    # define :test task and whatever else you want.

Keeping up to date with the latest rake tasks is easy.

    rake selfupdate

# Minimal

If you don't want gembase to bootstrap your entire project
but would like to use its conventions rake tasks, just grab
Rakefile.base and load it up.

    curl -sO https://raw.github.com/rcarver/gembase/master/Rakefile.base

# About

Gembase was created to keep Typekit's internal gems consistent. It was
written by Ryan Carver and Matt Colyer.

License: MIT

