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
  And I should see "Show all cases"
  When I follow "Clear search filters"
  Then I should be on the posts page
  And I should see "Recent Posts"
