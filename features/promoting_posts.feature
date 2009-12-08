Feature: Promoting Posts

  So that I can promote the development of a project
  As a user
  I want to be able to promote posts that I see

Scenario: Guests should not see a promote link
  Given I am not logged in
  And 10 posts exist
  And I am on the home page
  Then I should see a list of posts
  And I should not see "Promote" within "li.post"

Scenario: A user should be able to see if they have voted on a post
  Given I am logged in
  And a post "post" exists
  And I have promoted "post"
  Then I should have voted on "post"

Scenario: Users should see a promote link if they have not yet promoted the post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  Then I should see "Promote" within "li.post:first"

Scenario: Trying to promote an invalid post displays an error
  Given I am logged in
  When I visit the post page with id:1
  Then I should be on the posts page
  And I should see "The case could not be found"

Scenario: Users should be able to promote a post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  Given I follow "Promote" within "li.post:first"
  Then I should be on the posts page
  And my promoted posts should include "the post"
  And I should see "You promoted this post" within "li.post:first"
  Then a vote should exist with score: 1

Scenario: Users should see a message if they have already promoted the post
  Given I am logged in
  And a post "the post" exists
  And I have promoted "the post"
  And I am on the home page
  Then a vote "the vote" should exist with score: 1, user_id: 1
  And my promoted posts should include "the post"
  And I should see "You promoted this post" within "li.post:first"
