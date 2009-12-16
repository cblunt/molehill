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

Scenario: Guests should see a log in link if the case is open
  Given I am not logged in
  And 10 posts exist
  And I am on the home page
  Then I should see a list of posts
  And I should see "Log in to promote this case" within "li.post"

Scenario: Guests should not see a log in link if the case is not open
  Given I am not logged in
  And a post "post" exists
  And post "post" is complete
  When I am on the home page
  Then I should not see "Log in to promote this case" within "li.post"

Scenario: A user should not be able to promote their own post
  Given a post "post" exists with body: "Some Post"
  And I am logged in
  And "post" belongs to me
  When I am on the home page
  Then I should not see "Promote this case" within "li.post:first"

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

Scenario: Users should not see a promote link if the post is not open
  Given a post "post" exists
  And post "post" is complete
  When I am logged in
  And I am on the home page
  Then I should not see "Promote this case" within "li.post"

Scenario: Trying to promote an invalid post displays an error
  Given I am logged in
  When I visit the post page with id:1
  Then I should be on the posts page
  And I should see "The case could not be found"

Scenario: Users should be able to promote a post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  When I follow "Promote" within "li.post:first"
  Then I should be on the posts page
  And my promoted posts should include "the post"
  And I should see "You promoted this case" within "li.post:first"
  Then a vote should exist with score: 1

Scenario: Users should see a message if they have already promoted the post
  Given I am logged in
  And a post "the post" exists
  And I have promoted "the post"
  And I am on the home page
  Then a vote "the vote" should exist with score: 1, user_id: 1
  And my promoted posts should include "the post"
  And I should see "You promoted this case" within "li.post:first"

Scenario: A completed case should not show a promotion link
  Given I am logged in
  And a post "post" exists with completed_at: "1.day.ago"
  And "post" belongs to me
  And post "post" is complete
  When I am on the home page
  Then post "post" should not be open
  And I should not see "Promote" within "li.post:first" 

Scenario: A declined case should not show a promotion link
  Given I am logged in
  And a post "post" exists with declined_at: "1.day.ago"
  And "post" belongs to me
  And post "post" is declined
  When I am on the home page
  Then I should not see "Promote" within "li.post:first" 
