Given /^I initialize a gem called "([^"]*)"$/ do |name|
  Given %[a directory named "#{name}"]
  When %[I cd to "#{name}"]
  And %[I run the gembase install script]
end

When /^I run the gembase install script$/ do
  `cd #{current_dir} && cat ../../../init.sh | sh`
end

Given /^I commit the changes with "([^"]*)"$/ do |msg|
  Dir.chdir(current_dir) {
    `git add . && git commit -m "#{msg}"`
  }
end

Given /^the code lives on github$/ do
  `cd #{current_dir} && cd .. && mkdir github-repo && cd github-repo && git init --bare`
  `cd #{current_dir} && git remote add origin ../github-repo`
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

