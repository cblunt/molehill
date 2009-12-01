  
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
