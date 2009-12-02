Feature: Writing Posts

  So that I can contribute to the project
  As a user
  I want to be able to publish new posts

Scenario: Users should see the new post form
  Given I am logged in
  When I am on the home page
  Then there should be a "form#new_post"
  And there should be "textarea#post_body" within "form#new_post"
  And there should be "input[value='Post Case']" within "form#new_post"
