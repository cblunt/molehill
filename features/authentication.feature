Feature: Logging in and out of the application
  So that I can post new cases
  As a user
  I want to be able to log in to and out of my account

Scenario: Guests should see a log in link
  Given I am not logged in
  When I am on the home page
  Then I should see "Log in"

Scenario: Clicking log in should take me to the login page
  Given I am not logged in
  When I am on the home page
  And I follow "Log in"
  Then I should be on the login page

Scenario: Guests should see the login form
  Given I am not logged in
  When I am on the login page
  Then there should be "form#login"
  And I should see "Email Address" within "form#login"
  And I should see "Password" within "form#login"
  And there should be "input[type=text]#email_address" within "form#login"
  And there should be "input[type=password]#password" within "form#login"
  
Scenario: Authenticating with invalid password
  Given I am not logged in
  And a user exists with email_address: "foot@example.com", password: "secret"
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | invalid |
  And I press "Log in"
  Then I should be on the sessions page
  And I should see "Your account could not be authenticated."

Scenario: Trying to authenticate an account that has not been verified
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | secret |
  And I press "Log in"
  Then I should be on the sessions page
  And I should see "Your account could not be authenticated."
  And I should not be logged in

Scenario: Authenticated users should see a log out link
  Given I am logged in
  Then I should see "Log out"

Scenario: I should be able to log out of the application
  Given I am logged in 
  And I follow "Log Out"
  Then I should be on the home page
  And I should see "You have been logged out."
  And I should not be logged in
  
Scenario: Authenticating with invalid email address
  Given I am not logged in
  And a user exists with email_address: "bar@example.com", password: "secret"
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | secret |
  And I press "Log in"
  Then I should be on the sessions page
  And I should see "Your account could not be authenticated."
  
Scenario: Authenticating with valid details 
  Given a user exists who is verified
  And I am on the login page
  And I fill in the following:
    | Email Address | foo@bar.com |
    | Password | secret |
  And I press "Log in"
  #Then I should be on the home page
  Then I should see "Logged in successfully."
  And I should be logged in
