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
