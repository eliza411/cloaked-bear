Feature: Search
  In order to use the site 
  I need to be able to see the front page

  Scenario: Visiting front page
    Given I am on "/"
    Then I should see "Welcome"
