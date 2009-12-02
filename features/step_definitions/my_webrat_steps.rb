Then /^there should be( a| an)? "([^\"]*)"$/ do |an, selector|
  response.should have_tag(selector)
end

Then /^there should be( a| an)? "([^\"]*)" within "([^\"]*)"$/ do |an, selector, scope|
  within(scope) do |s|
    s.should have_tag(selector)
  end
end
