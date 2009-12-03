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

Scenario: Publishing a new post
  Given I am logged in
  And I am on the home page
  When I fill in "post_body" with "Just reporting some crazy bug I found in your application!"
  And I press "Post Case"
  Then a post should exist with body: "Just reporting some crazy bug I found in your application!"
  And the post's user should be me
  And I should be on the posts page
  And I should see "Your post was added."
  And there should be a "li.post" within "ul#posts"
  And I should see "Just reporting some crazy bug I found in your application!"

Scenario: Publishing a new post when not logged in should throw an error
  Given I am not logged in
  And I try to post to the posts page
  Then I should be on the login page
  And I should see "You must first log in or sign up before accessing this page."
