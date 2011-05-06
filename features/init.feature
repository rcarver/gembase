Feature: Gembase initializes a new gem project

  Scenario: Install in an empty directory
    Given a directory named "myproject"
    When I cd to "myproject"
    And I run the gembase install script
    Then a file named ".gitignore" should exist
    And a file named "CHANGELOG.md" should exist
    And a file named "README.md" should exist
    And a file named "Rakefile" should exist
    And a file named "Rakefile.base" should exist
    And a file named "myproject.gemspec" should exist
    And a file named "lib/myproject.rb" should exist
    And a file named "lib/myproject/version.rb" should exist
    And the file ".gitignore" should contain "Gemfile.lock"
    And the file "Rakefile" should contain "task :test"
