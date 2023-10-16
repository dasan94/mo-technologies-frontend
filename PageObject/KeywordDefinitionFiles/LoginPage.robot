*** Settings ***
Library         SeleniumLibrary
Variables       ../Locators/Locators.py
Variables       ../TestData/Testdata.py


*** Keywords ***
Given I open the Browser with URL
    Create Webdriver    ${browser_name}
    Go To    ${url}
    Maximize Browser Window
    Sleep    2

When I fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    ${username_locator}    ${username}
    Input Password    ${password_locator}    ${password}
    Click Button    ${submit_locator}
    Sleep    2

When I click on logout
    Click Element    ${logout_button}
    Sleep    2

Then I verify the error message is correct for username
    Element Text Should Be    ${login_error_message}    Your username is invalid!

Then I verify the error message is correct for password
    Element Text Should Be    ${login_error_message}    Your password is invalid!

Then I verify Home page opens
    Element Text Should Be    ${home_title}    Logged In Successfully

Then I should redirect to Login page
    Element Text Should Be    ${test_login_title}    Test login

And Close Browser Session
    Close Browser
