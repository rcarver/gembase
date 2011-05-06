Feature: Gembase releases gems

  @wip
  Scenario: Release my gem
    Given I initialize a gem called "myproject"
    And I commit the changes with "initialize the gem"
    And the code lives on github
    And I successfully run `git push origin master`
    When I fill in project information in the gemspec
    And I commit the changes with "setup gemspec"
    And I successfully run `rake release`
    And a file named "pkg/myproject-0.0.1.gem" should exist
    Then the stdout from "git tag" should contain "v0.0.1"
