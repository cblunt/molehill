When /^I create a post "(.)*"$/ do |body|
  Given 'I am on the home page'
  When 'I fill in "post_body" with "#{body}"'
  And 'I press "Post Case"'
end
