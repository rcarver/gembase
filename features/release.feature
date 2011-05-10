Feature: Gembase releases gems

  Scenario: Release my gem
    Given I initialize a gem called "myproject"
    When I commit the changes with "initialize the gem"
    And the code lives on github
    And I push the latest changes to github
    And I fill in project information in the gemspec
    And I remove the rubyforge_project from the gemspec
    And I commit the changes with "setup gemspec"
    And I successfully run `rake release`
    Then a file named "pkg/myproject-0.0.1.gem" should exist
    And the changelog contains "setup gemspec"
    And my local project has the tag "v0.0.1"
    And my project on github has the commit "Release v0.0.1"
    And my project on github has the tag "v0.0.1"

  Scenario: Abort on a bad gemspec
    Given I initialize a gem called "myproject"
    When I commit the changes with "initialize the gem"
    And I run `rake release`
    Then the stderr from "rake release" should contain "is not an author"
    And my local project does not have the tag "v0.0.1"

  Scenario: Abort if not on the master branch
    Given I initialize a gem called "myproject"
    When I commit the changes with "initialize the gem"
    And I run `git checkout -b foo`
    And I run `rake release`
    Then the stderr from "rake release" should contain "You must be on the master branch to release."

  Scenario: Re-releasing the same version is forbidden
    Given I initialize a gem called "myproject"
    When I commit the changes with "initialize the gem"
    And I successfully run `git tag v0.0.1`
    And I run `rake release`
    Then the stderr from "rake release" should contain "This tag has already been committed to the repo"
