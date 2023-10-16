*** Settings ***
Documentation       Tests to login to Login Page

Library             SeleniumLibrary
Resource            ../PageObject/KeywordDefinitionFiles/LoginPage.robot


*** Test Cases ***
Validate Unsuccessful Login using invalid username and valid password
    Given I open the Browser with URL
    When I fill the login form    ${Invalid_Username}    ${valid_Password}
    Then Then I verify the error message is correct for username
    And Close Browser Session

Validate Unsuccessful Login using valid username and invalid password
    Given I open the Browser with URL
    When I fill the login form    ${valid_Username}    ${Invalid_Password}
    Then Then I verify the error message is correct for password
    And Close Browser Session

Validate Unsuccessful Login using invalid username and password
    Given I open the Browser with URL
    When I fill the login form    ${Invalid_Username}    ${Invalid_Password}
    Then Then I verify the error message is correct for username
    And Close Browser Session

Validate successful Login
    Given I open the Browser with URL
    When I fill the login form    ${valid_Username}    ${valid_Password}
    Then I verify Home page opens
    And Close Browser Session

Validate successful Logout
    Given I open the Browser with URL
    When I fill the login form    ${valid_Username}    ${valid_Password}
    Then I verify Home page opens
    When I click on logout
    Then I should redirect to Login page
    And Close Browser Session
