Feature: Writing Posts

  So that I can contribute to the project
  As a user
  I want to be able to publish new posts

Scenario: Users should see the new post form
  Given I am logged in
  When I am on the home page
  Then I should see "Post a feature or bug"
  And there should be 1 "form#new_post"
  And there should be "textarea#post_body" within "form#new_post"
  And there should be "input[value='Post Case']" within "form#new_post"

Scenario: Publishing a new post should add the post and display it on the homepage
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

Scenario: Publishing a new post when not logged in redirect to the login page
  Given I am not logged in
  And I try to post to the posts page
  Then I should be on the login page
  And I should see "You must first log in or sign up before accessing this page."

Scenario: Trying to publish an empty post should display an error
  Given I am logged in
  And I press "Post Case"
  Then I should be on the posts page
  And I should see "It looks like your post couldn't be saved."
