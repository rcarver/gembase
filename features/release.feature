Feature: Gembase releases gems

  @wip
  Scenario: Release my gem
    Given I initialize a gem called "myproject"
    And I commit the changes with "initialize the gem"
    And the code lives on github
    And I push the latest changes to github
    When I fill in project information in the gemspec
    And I commit the changes with "setup gemspec"
    And I successfully run `rake release`
    And a file named "pkg/myproject-0.0.1.gem" should exist
    Then my project has the tag "v0.0.1"
    And the latest commit on github should be "Release v0.0.1"
    # try to release again it should fail
    # then change the tag and release again
