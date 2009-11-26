Feature: Viewing Posts

  So that I can see that latest posts
  As a guest
  I want to see a list of all posts on the homepage ordered by date

Scenario: Show the 10 most recent posts
  Given I am not logged in
  When I visit the homepage
  Then I should see a list of posts
  Then I should see the 3 most recent posts
