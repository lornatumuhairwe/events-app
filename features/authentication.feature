Feature: Authentication
    Inorder to use the website
    As a user
    I should be able to sign up, log in and log out

Scenario: Sign up
    Given I visit the home page
    And I click the Sign up button
    When I fill the sign up form
    And I submit the sign up form
    And I confirm my email
    Then I should see that my email has been confirmed

Scenario: Log in
    Given I am a registered user
    And I vist the home page
    When I fill in the log in form
    Then I should be logged in

Scenario: Log out
    Given I am a registered user
    And I am logged in
    And I visit the home page
    When I click the log out button
    Then I should be redirected to the log in page
