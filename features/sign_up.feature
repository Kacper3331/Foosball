Feature: New user should create their player account
  In order to play matches
  As a newcomer of this application
  I need to create player account

  Scenario: View Home Page
    Given I am on Home Page
    Then I should see "Sign up"

  Scenario: View Sign up form
    Given I am on Home Page
    When I press "Sign up"
    Then I should see "Sign up"
    And I should see "Email"
    And I should see "Firstname"
    And I should see "Lastname"
    And I should see "Password"
    And I should see "Confirm Password"

  Scenario: Sign up new player
    Given I am on "Sign up" page
    And I am new player
    When I fill in "Email" with "example@example.pl"
    And I fill in "Firstname" with "Adam"
    And I fill in "Lastname" with "Nowak"
    And I fill in "Password" with "example123"
    And I fill in "Confirm Password" with "example123"
    Then I press "Sign up"
    And I should see "Welcome! You have signed up successfully."

  Scenario: Invalid Confirm Password
    Given I am on "Sign up" page
    And I am new player
    When I fill in "Email" with "example@example.pl"
    And I fill in "Firstname" with "Adam"
    And I fill in "Lastname" with "Nowak"
    And I fill in "Password" with "example123"
    And I fill in "Confirm Password" with "invalid"
    Then I press "Sign up"
    And I should see "doesn't match Password"

  Scenario: Empty Email field
    Given I am on "Sign up" page
    And I am new player
    When I fill in "Email" with " "
    And I fill in "Firstname" with "Adam"
    And I fill in "Lastname" with "Nowak"
    And I fill in "Password" with "example123"
    And I fill in "Confirm Password" with "example123"
    Then I press "Sign up"
    And I should see "can't be blank"

  Scenario: Empty Firstname field
    Given I am on "Sign up" page
    And I am new player
    When I fill in "Email" with "example@example.pl"
    And I fill in "Firstname" with " "
    And I fill in "Lastname" with "Nowak"
    And I fill in "Password" with "example123"
    And I fill in "Confirm Password" with "example123"
    Then I press "Sign up"
    And I should see "can't be blank"

  Scenario: Empty Lastname field
    Given I am on "Sign up" page
    And I am new player
    When I fill in "Email" with "example@example.pl"
    And I fill in "Firstname" with "Adam"
    And I fill in "Lastname" with " "
    And I fill in "Password" with "example123"
    And I fill in "Confirm Password" with "example123"
    Then I press "Sign up"
    And I should see "can't be blank"
