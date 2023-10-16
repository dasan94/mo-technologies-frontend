*** Settings ***
Documentation       Tests to login to Login Page

Library             SeleniumLibrary


*** Variables ***
${valid_username}           student
${valid_password}           Password123
${invalid_username}         incorrectUser
${invalid_password}         incorrectPassword
${url}                      https://practicetestautomation.com/practice-test-login/
${browser_name}             Chrome
${login_error_message}      css:.show
${home_title}               css:.post-title


*** Test Cases ***
Validate Unsuccessful Login using invalid username and valid password
    Given I open the Browser with URL
    When I fill the login form    ${invalid_username}    ${valid_password}
    Then Then I verify the error message is correct for username
    And Close Browser Session

Validate Unsuccessful Login using valid username and invalid password
    Given I open the Browser with URL
    When I fill the login form    ${valid_username}    ${invalid_password}
    Then Then I verify the error message is correct for password
    And Close Browser Session

Validate Unsuccessful Login using invalid username and password
    Given I open the Browser with URL
    When I fill the login form    ${invalid_username}    ${invalid_password}
    Then Then I verify the error message is correct for username
    And Close Browser Session

Validate successful Login
    Given I open the Browser with URL
    When I fill the login form    ${valid_username}    ${valid_password}
    Then I verify Home page opens
    And Close Browser Session


*** Keywords ***
Given I open the Browser with URL
    Create Webdriver    ${browser_name}
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

When I fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    css:input[name=username]    ${username}
    Input Password    css:input[name=password]    ${password}
    Click Button    css:button[id=submit]
    Set Selenium Implicit Wait    5

Then I verify the error message is correct for username
    Element Text Should Be    ${login_error_message}    Your username is invalid!

Then I verify the error message is correct for password
    Element Text Should Be    ${login_error_message}    Your password is invalid!

Then I verify Home page opens
    Element Text Should Be    ${home_title}    Logged In Successfully

And Close Browser Session
    Close Browser
