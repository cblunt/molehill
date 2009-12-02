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

Scenario: Attempting to register an account with an invalid email address
  Given I am on the signup page
  When I fill in the following:
    | Email Address | oops |
    | Password | secret |
    | Confirm Password | secret |
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Email address is invalid"

Scenario: Attempting to register an account with an invalid password
  Given I am on the signup page
  When I fill in the following:
    | Email Address | oops |
    | Password | |
    | Confirm Password | |
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Password can't be blank"

Scenario: Attempting to register an account with unmatched passwords
  Given I am on the signup page
  When I fill in the following:
    | Email Address | foo@bar.com |
    | Password | secret |
    | Confirm Password | notsecret |
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Password doesn't match confirmation"

Scenario: Registering with valid details creates a unverified user
  Given I am on the signup page
  When I fill in the following:
    | Email Address | foo@bar.com |
    | Password | secret |
    | Confirm Password | secret |
  And I press "Sign up"
  Then a user should exist with email_address: "foo@bar.com", verified_at: nil
  And I should be on the home page
  And I should not be logged in
  And I should see "Thank you for signing up! Please check your emails for a verification link."

Scenario: Verifying a newly created account
  Given I am on the signup page
  When I fill in the following:
    | Email Address | foo@bar.com |
    | Password | secret |
    | Confirm Password | secret |
  And I press "Sign up"
  Then I should receive an email
  When I open the email
  Then I should see "Please verify your account" in the email subject
  When I follow "Verify Your Account" in the email
  Then I should see "Thank you for verifying your account!"
  And I should be logged in
  And I should be on the home page
  

Scenario: The verification key is wrong
  Given a user exists with email_address: "foo@bar.com", password: "secret" 
  And I visit the verification page with id:8, verification_key:invalid
  Then I should see "Your account could not be verified"
  And I should not be logged in
