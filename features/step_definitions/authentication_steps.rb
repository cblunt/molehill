Given /^I am not logged in$/ do
  @current_user = nil
end

Given /^I am logged in$/ do
  @current_user = Factory.create(:user)

  visit login_path
  fill_in("email_address", :with => "foo@bar.com")
  fill_in("password", :with => "secret")
  click_button("Log in")
end

Then /^I should( not)? be logged in/ do |flag|
  if flag.blank?
    controller.current_user.should_not be_nil
  else
    controller.current_user.should be_nil
  end
end
