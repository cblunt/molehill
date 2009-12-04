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

Scenario: Users should see a promote link if they have not yet promoted or demoted the post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  And I have not promoted "the post"
  And I have not demoted "the post"
  Then I should see "Promote" within "li.post:first"

Scenario: Users should see a message if they have already promoted the post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  And I have promoted "the post"
  Then I should see "You promoted this post" within "li.post:first"

Scenario: Users should see a message if they have already demoted the post
  Given I am logged in
  And a post "the post" exists
  And I am on the home page
  And I have demoted "the post"
  Then I should see "You demoted this post" within "li.post:first"
