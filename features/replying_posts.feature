Feature:
  In order to suggest that a post is ready for closing
  As a user
  I want to be able to suggest that a case be completed or destroyed.

Scenario: A guest should not see a suggest Completed or Declined link
  Given a user "joe" exists with username: "joe"
  And another user "bob" exists with username: "bob", email_address: "bob@company.com"
  And a post "post" exists with body: "Some Post"
  And post "post" belongs to user "joe"
  When I am not logged in
  And I am on the home page
  Then I should not see "Tell joe this case is completed"

Scenario: A user should see a suggest Completed or Declined link
  Given a user "joe" exists with username: "joe"
  And another user "bob" exists with username: "bob", email_address: "bob@company.com"
  And a post "post" exists with body: "Some Post"
  And post "post" belongs to user "joe"
  When I am logged in as user "bob"
  And I am on the home page
  Then I should see "Suggest this case Complete or Declined to joe" within "p.context_sensitive"
