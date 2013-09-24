Feature: show links
  In order to remember my website links
  As a user
  I want to be able to view previously saved links

Scenario: First visit to the home page
  Given I am on the homepage
  Then I should see "Welcome to Linki.o.us"
  And there should be no links

Scenario: Saving a link
  Given