# I visit verify page with "id:10, key:jnkinjkn"
When /^(?:|I )visit (.+) with (.+)$/ do |page_name, param_string|
  params = {}
  param_string.split(",").each do |match|
    parts = match.split(":") 
    
    key = parts[0]
    val = parts[1]
    
    params[key.to_s.strip] = val.to_s.strip
  end
  
  visit path_to(page_name, params)
end

Then /^there should be( a| an)? "([^\"]*)"$/ do |an, selector|
  response.should have_tag(selector)
end

Then /^there should be( a| an)? "([^\"]*)" within "([^\"]*)"$/ do |an, selector, scope|
  within(scope) do |s|
    s.should have_tag(selector)
  end
end


Then /^there should not be( a| an)? "([^\"]*)"$/ do |an, selector|
  response.should_not have_tag(selector)
end

Then /^there should not be( a| an)? "([^\"]*)" within "([^\"]*)"$/ do |an, selector, scope|
  within(scope) do |s|
    s.should_not have_tag(selector)
  end
end
