Feature: User signs in to their player account
  In order to visit player page
  As a user of this application
  I want to be able to sign in to the my account

  Scenario: View home page
    Given I am on Home Page
    Then I should see "Sign in"

  Scenario: Sign in to player account
    Given I am on Home Page
    And there's a player with email: "example@example.pl" and password: "example123"
    When I fill in "Email" with "example@example.pl"
    And I fill in "Password" with "example123"
    And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: Invalid password
    Given I am on Home Page
    And there's a player with email: "example@example.pl" and password: "example123"
    When I fill in "Email" with "example@example.pl"
    And I fill in "Password" with "wrong"
    And I press "Sign in"
    Then I should see "Invalid email or password."

  Scenario: Sign out from player account
    Given I am on Home Page
    And I sign in using email: "example@example.pl" and password: "example123"
    When I press link: "Logout"
    Then I should see "Signed out successfully."
