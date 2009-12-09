Feature: Closing Posts
  So that posts can be closed
  As a user
  I should be able to mark my posts as completed or declined

Scenario: A close link is displayed for posts owned by the user
  Given I am logged in
  And a post "post" exists
  And "post" belongs to me
  When I am on the home page
  Then I should see "Mark as Completed or Declined" within "li.post:first"

Scenario: Clicking Complete should mark the post as completed
  Given I am logged in
  And a post "post" exists
  And "post" belongs to me
  When I am on the home page
  And I follow "Completed" within "li.post:first"
  Then I should be on the posts page
  And the post "post" should be completed
  And the post "post" should not be open
  And I should see "Case completed."
  And I should not see "Mark as Completed or Declined" within "li.post:first"
  And I should see "Completed" within "li.post:first"

Scenario: Clicking Decline should mark the post as declined
  Given I am logged in
  And a post "post" exists
  And "post" belongs to me
  When I am on the home page
  And I follow "Declined" within "li.post:first"
  Then I should be on the posts page
  And the post "post" should be declined
  And the post "post" should not be open
  And I should see "Case declined."
  And I should not see "Mark as Completed or Declined" within "li.post:first"
  And I should see "Declined" within "li.post:first"
