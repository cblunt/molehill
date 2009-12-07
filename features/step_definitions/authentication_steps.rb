Given /^I am not logged in$/ do
  @current_user = nil
end

Given /^I am logged in$/ do
  @current_user = Factory(:user)
  @current_user.verify_with_key(@current_user.verification_key)

  visit login_path
  fill_in("email_address", :with => "foo@bar.com")
  fill_in("password", :with => "secret")
  click_button("Log in")
end

Given /^a user exists who is verified$/ do
  user = Factory(:user)
  user.verify_with_key(user.verification_key)  
end

Then /^I should( not)? be logged in/ do |flag|
  if flag.blank?
    controller.current_user.should_not be_nil
  else
    controller.current_user.should be_nil
  end
end

Then /^I should see my email address/ do
  Then "I should see \"#{controller.current_user.email_address}\""
end
