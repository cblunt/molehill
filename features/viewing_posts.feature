Feature: Viewing Posts

  So that I can see that latest posts
  As a guest
  I want to see a list of all posts on the homepage ordered by date

Scenario: People should see the latest posts if no posts have been promoted
  Given I am not logged in
  And 20 posts exist
  When I am on the home page
  Then I should see "Recent Posts"
  And I should see a list of posts
  And I should see the 10 most recent posts

Scenario: A post should show its author
  Given I am logged in
  And I am on the home page
  When I fill in "post_body" with "Just reporting some crazy bug I found in your application!"
  And I press "Post Case"
  Then I should be on the posts page
  And I should see "joebloggs"
  And I should see "Just reporting some crazy bug I found in your application!"

Scenario: People should see the most promoted posts first
  Given I am logged in
  And 3 posts exist
  And another post "promoted post" exists with body: "the promoted post"
  And post "promoted post" has a score of 3
  When I am on the home page
  Then I should see "Recent Posts"
  And I should see a list of posts
  And I should see "the promoted post" within "li.post[1]"
  And I should see "Some random post" within "li.post[2]"
  And I should see "Some random post" within "li.post[3]"
  And I should see "Some random post" within "li.post[4]"

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

Scenario: An unscored post should not display its score
  Given I am logged in
  And a post "post" exists
  And post "post" has no score
  And I am on the home page
  Then I should not see "Score: 0" within "li.post:first"

Scenario: A guest should see a link offering to log in to score a post
  Given I am not logged in
  And a post "post" exists
  And post "post" has no score
  And I am on the home page
  Then I should not see "Log in to promote this case" within "li.post:first"

Scenario: Guests should be able to see a post's score
  Given I am not logged in
  And a post "post" exists
  And post "post" has a score of 5
  And I am on the home page
  Then I should see "Score: 5" within "li.post:first"

Scenario: Guests should be able to see an individual post should just show that post
  Given I am not logged in
  And a post "post" exists with id: 1, body: "This is a post"
  When I visit the post page with id:1
  Then I should see "This is a post"

Scenario: A home link should exist on any page
  Given I am not logged in
  And I am on the home page
  Then I should see "Home"
  When I follow "Home"
  Then I should be on the home page
  Given I am logged in
  And I am on the home page
  Then I should see "Home"
  When I follow "Home"
  Then I should be on the home page

Scenario: An avatar should be displayed next to posts
  Given I am not logged in
  And a post exists
  When I am on the home page
  Then there should be "img.gravatar" within "li.post:first"
