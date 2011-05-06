When /^I run the gembase install script$/ do
  `cd #{current_dir} && cat ../../../init.sh | sh`
end

