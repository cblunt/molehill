  
  So that I can post new cases
  As a guest
  I want to be able to log in to my account

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
  
Scenario: Authenticating with invalid email address
  Given I am not logged in
  And a user exists with email_address: "bar@example.com", password: "secret"
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | secret |
  And I press "Log in"
  Then I should be on the sessions page
  And I should see "Invalid email address or password."

Scenario: Authenticating with invalid password
  Given I am not logged in
  And a user exists with email_address: "foot@example.com", password: "secret"
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | invalid |
  And I press "Log in"
  Then I should be on the sessions page
  And I should see "Invalid email address or password."

Scenario: Authenticating with valid details 
  Given a user exists with email_address: "foo@example.com", password: "secret"
  When I am on the login page
  And I fill in the following:
    | Email Address | foo@example.com |
    | Password | secret |
  And I press "Log in"
  Then I should be on the home page
  And I should see "Logged in successfully."
  And I should be logged in

Scenario: Authenticated users should see a log out link
  Given I am logged in
  Then I should see "Log out"

Scenario: I should be able to log out of the application
  Given I am logged in 
  And I follow "Log Out"
  Then I should be on the home page
  And I should see "You have been logged out."
  And I should not be logged in
