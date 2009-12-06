Feature: Hashtags
  So that posts can be filtered and searched
  As a user
  I should be able to use hashtags within posts, and search by those tags

Scenario: Posting a case with new hashtags should create new hashtag records
  Given I am logged in
  And I am on the home page
  And I fill in "post_body" with "This is a post about #users and #accounts"
  And I press "Post Case"
  Then a post should exist with body: "This is a post about #users and #accounts"
  Then a tag should exist
  And a tag should exist with name: "#users"
  And a tag should exist with name: "#accounts"
  Given I am on the home page
  Then there should be "a[title='#users']" within "li.post:first"
  And there should be "a[title='#accounts']" within "li.post:first"

  Scenario: Searching for cases by hashtag should only display those posts that have a matching hashtag
    Given I am not logged in
    And the following posts exist:
      | body | 
      | this is a post that will be #matched |
      | this is a post that will be #unmatched |
    Then 2 posts should exist
    Given I visit the home page with "search[terms]=matched"
    Then I should see "this is a post that will be #matched"
    And I should not see "this is a post that will be #unmatched"
