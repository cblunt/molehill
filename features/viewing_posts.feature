Feature: Viewing Posts

  So that I can see that latest posts
  As a guest
  I want to see a list of all posts on the homepage ordered by date

Scenario: Guests should see the latest posts
  Given I am not logged in
  And 20 posts exist
  When I am on the home page
  Then I should see "Recent Posts"
  And I should see a list of posts
  And I should see the 10 most recent posts

Scenario: Guests should not see a next page link when 10 or fewer posts exist
  Given I am not logged in
  And 10 posts exist
  When I am on the home page
  Then I should not see "Next Page"

Scenario: Guests should see a next page link when more than 10 posts exist
  Given I am not logged in
  And 20 posts exist
  When I am on the home page
  Then I should see "Next Page"

Scenario: Guests should be able to page through posts
  Given I am not logged in
  And 20 posts exist
  When I am on the home page
  And I follow "Next Page"
  Then I should be on the posts page

Scenario: Guests should not see the new post entry form
  Given I am not logged in
  When I am on the home page
  Then there should not be "form#new_post"
  And there should not be "input[value='Post Case']"
