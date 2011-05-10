Given /^I initialize a gem called "([^"]*)"$/ do |name|
  Given %[a directory named "#{name}"]
  When %[I cd to "#{name}"]
  And %[I run the gembase install script]
end

When /^I run the gembase install script$/ do
  `cd #{current_dir} && cat ../../../init.sh | RAKETEMPLATE=../../../Rakefile.template RAKEBASE=../../../Rakefile.base sh`
end

Given /^I commit the changes with "([^"]*)"$/ do |msg|
  Dir.chdir(current_dir) {
    `git add . && git commit -m "#{msg}"`
  }
end

Given /^the code lives on github$/ do
  Dir.chdir(File.join(current_dir, "..")) {
    Dir.mkdir("github-repo")
  }
  Dir.chdir(File.join(current_dir, "..", "github-repo")) {
    `git init --bare`
  }
  Dir.chdir(current_dir) {
    `git remote add origin ../github-repo`
  }
end

Given /^I push the latest changes to github$/ do
  Dir.chdir(current_dir) {
    When %[I successfully run `git push -u origin master`]
  }
end

When /^I fill in project information in the gemspec$/ do
  info = {
    "TODO: Write your name" => "John Smith",
    "TODO: Write your email address" => "john@example.com",
    "TODO: Write a gem summary" => "A sample gem",
    "TODO: Write a gem description" => "A sample gem"
  }
  file = "myproject.gemspec"
  Dir.chdir(current_dir) {
    info.each { |a, b|
      `{ rm #{file} && sed -e 's/#{a}/#{b}/' > #{file}; } < #{file}`
    }
  }
end

When /^I remove the rubyforge_project from the gemspec$/ do
  file = "myproject.gemspec"
  Dir.chdir(current_dir) {
    `{ rm #{file} && grep -v rubyforge_project > #{file}; } < #{file}`
  }
end

Then /^my project has the tag "([^"]*)"$/ do |tag_name|
  Dir.chdir(current_dir) {
    `git tag`.should include(tag_name)
  }
end

Then /^the changelog contains "([^"]*)"$/ do |text|
  Dir.chdir(current_dir) {
    `cat CHANGELOG.md`.should include(text)
  }
end

Then /^the latest commit on github should be "([^"]*)"$/ do |msg|
  Dir.chdir(File.join(current_dir, "..", "github-repo")) {
    `git log`.should include(msg)
  }
end

