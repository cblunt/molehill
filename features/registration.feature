Feature: Registering for a new account
  So that I can post cases and become a member
  As a guest
  I want to be able to register for a new account

Scenario: Show the signup link
  Given I am not logged in
  When I am on the login page
  Then I should see "Sign up!"

Scenario: Show the registration page
  Given I am not logged in
  And I am on the login page
  When I follow "Sign up!"
  Then I should be on the signup page
  And I should see "Email Address" within "form"
  And I should see "Password" within "form"
  And I should see "Confirm Password" within "form"
  And there should be an "input[value='Sign up']" within "form"

Scenario: Attempting to register an account with missing details
  Given I am on the signup page
  When I fill in the following:
    | Email Address | |
    | Password | secret |
    | Confirm Password | secret |
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Email address is invalid"
