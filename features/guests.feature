Feature:
  In order to learn about Molehill
  As a guest
  I want to be able to read help and information

Scenario: I want to learn about Molehill
  Given I am on the home page
  Then I should see "About"
  When I follow "About"
  Then I should be on the about page
  And I should see "About Molehill"
  And I should see "How to use Molehill"

Scenario: I want to get involved developing Molehill
  Given I am on the about page
  Then I should see "Developers"
  And I should see "github"
