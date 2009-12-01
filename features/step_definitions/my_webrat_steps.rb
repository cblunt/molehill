Then /^there should be "([^\"]*)"$/ do |selector|
  response.should have_tag(selector)
end

Then /^there should be "([^\"]*)" within "([^\"]*)"$/ do |selector, scope|
  within(scope) do |s|
    s.should have_tag(selector)
  end
end
