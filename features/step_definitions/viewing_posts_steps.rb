Given /^there are ([0-9]*) posts$/ do |count|
  count.to_i.times do 
    Factory(:post)
  end
end

Then /^I should see a list of posts$/ do
  response.should have_tag "ul#posts"
end

Then /^I should see the ([0-9]*) most recent posts$/ do |count|
  count.to_i.times do |n|
    response.should have_tag "li.post:nth-child(#{n+1})"
  end
end
