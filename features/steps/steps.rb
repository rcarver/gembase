Given /^I initialize a gem called "([^"]*)"$/ do |name|
  step %[a directory named "#{name}"]
  step %[I cd to "#{name}"]
  step %[I run the gembase install script]
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
    step %[I successfully run `git push -u origin master`]
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

Then /^my local project (does not have|has) the tag "([^"]*)"$/ do |yes_or_no, tag_name|
  Dir.chdir(current_dir) {
    if yes_or_no == "has"
      `git tag`.should include(tag_name)
    else
      `git tag`.should_not include(tag_name)
    end
  }
end

Then /^the changelog contains "([^"]*)"$/ do |text|
  Dir.chdir(current_dir) {
    `cat CHANGELOG.md`.should include(text)
  }
end

Then /^my project on github has the commit "([^"]*)"$/ do |msg|
  Dir.chdir(File.join(current_dir, "..", "github-repo")) {
    `git log`.should include(msg)
  }
end

Then /^my project on github has the tag "([^"]*)"$/ do |tag|
  Dir.chdir(File.join(current_dir, "..", "github-repo")) {
    `git tag`.should include(tag)
  }
end

