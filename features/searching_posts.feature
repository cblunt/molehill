Feature: Searching
  So that I can refine the posts I see
  As a user
  I should be able to apply and remove hashtag filters

Scenario: Searching for cases by hashtag should only display those posts that have a matching hashtag
  Given I am not logged in
  And the following posts exist:
    | body | 
    | this is a post that will be #matched |
    | this is a post that will be #unmatched |
  Then 2 posts should exist
  Given I am on the home page
  And I follow "#matched"
  Then I should be on the posts page
  And I should see "this is a post that will be #matched"
  And I should not see "this is a post that will be #unmatched"
  Given I am on the home page
  And I follow "#unmatched"
  Then I should be on the posts page
  And I should not see "this is a post that will be #matched"
  And I should see "this is a post that will be #unmatched"

Scenario: Searching should show filters in use
  Given I am not logged in
  And the following posts exist:
    | body | 
    | this is a post that will be #matched |
    | this is a post that will be #unmatched |
  Then 2 posts should exist
  Given I am on the home page
  And I follow "#matched"
  Then I should be on the posts page
  And I should not see "Recent Posts"
  And I should see "All cases matching #matched"

Scenario: People should be able to clear filters
  Given I am not logged in
  And the following posts exist:
    | body | 
    | this is a post that will be #matched |
    | this is a post that will be #unmatched |
  Then 2 posts should exist
  Given I am on the home page
  And I follow "#matched"
  Then I should be on the posts page
  And I should see "Clear search filters"
  When I follow "Clear search filters"
  Then I should be on the posts page
  And I should see "Recent Posts"

Scenario: People should see a search form
  Given I am not logged in
  When I am on the home page
  Then there should be "div#filters"
  And there should be an "input#tag_string" within "div#filters"
  And there should be an "input[type=submit]" within "div#filters"

Scenario: Searching using the search form should display matching posts
  Given I am not logged in
  And the following posts exist:
    | body | 
    | this is a post that will be #matched |
    | this is a post that will be #unmatched |
  Then 2 posts should exist
  When I am on the home page
  And I fill in "tag_string" with "matched"
  And I press "Search"
  Then I should be on the posts page
  And I should see "Clear search filters"
  And I should see "this is a post that will be #matched"
  And I should not see "this is a post that will be #unmatched"

Scenario: Searching multiple terms should return all matches
  Given I am not logged in
  And the following posts exist:
    | body | 
    | this is a post that will be #matched |
    | this is a post that will be #unmatched |
    | this is a #post that will be matched |
  When I am on the home page
  And I fill in "tag_string" with "matched post"
  And I press "Search"
  Then I should be on the posts page
  And I should see "Clear search filters"
  And I should see "this is a post that will be #matched"
  And I should see "this is a #post that will be matched"
  And I should not see "this is a post that will be #unmatched"
