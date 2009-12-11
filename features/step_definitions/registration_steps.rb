When /^I click link (\d) in the email$/ do |link_number|
  link = links_in_email(current_email)[link_number.to_i - 1]
  request_uri = URI::parse(link).request_uri
  visit request_uri
end
