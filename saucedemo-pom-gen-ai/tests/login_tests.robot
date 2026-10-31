*** Settings ***
Documentation     Valid, invalid, boundary, and edge-case tests for SauceDemo login.
Library           SeleniumLibrary
Resource          ../business/login_keyword.robot
Test Setup        Open SauceDemo Login Page    ${LOGIN_URL}    ${BROWSER}
Test Teardown     Close SauceDemo Browser
Test Tags         login    regression

*** Variables ***
${LOGIN_URL}                         https://www.saucedemo.com
${BROWSER}                           chrome
${VALID_PASSWORD}                    secret_sauce
${INVALID_CREDENTIALS_ERROR}         Epic sadface: Username and password do not match any user in this service
${USERNAME_REQUIRED_ERROR}           Epic sadface: Username is required
${PASSWORD_REQUIRED_ERROR}           Epic sadface: Password is required
${LOCKED_OUT_ERROR}                  Epic sadface: Sorry, this user has been locked out.

*** Test Cases ***
Standard User Can Log In
    Login Should Succeed    standard_user    ${VALID_PASSWORD}

Problem User Can Log In
    Login Should Succeed    problem_user    ${VALID_PASSWORD}

Performance Glitch User Can Log In
    Login Should Succeed    performance_glitch_user    ${VALID_PASSWORD}

Error User Can Log In
    Login Should Succeed    error_user    ${VALID_PASSWORD}

Visual User Can Log In
    Login Should Succeed    visual_user    ${VALID_PASSWORD}

Locked Out User Cannot Log In
    Login Should Show Error    locked_out_user    ${VALID_PASSWORD}    ${LOCKED_OUT_ERROR}

Unknown Username Is Rejected
    Login Should Show Error    unknown_user    ${VALID_PASSWORD}    ${INVALID_CREDENTIALS_ERROR}

Incorrect Password Is Rejected
    Login Should Show Error    standard_user    wrong_password    ${INVALID_CREDENTIALS_ERROR}

Incorrect Username And Password Are Rejected
    Login Should Show Error    unknown_user    wrong_password    ${INVALID_CREDENTIALS_ERROR}

Both Fields Empty Require Username
    Login Should Show Error    ${EMPTY}    ${EMPTY}    ${USERNAME_REQUIRED_ERROR}

Empty Username Requires Username
    Login Should Show Error    ${EMPTY}    ${VALID_PASSWORD}    ${USERNAME_REQUIRED_ERROR}

Empty Password Requires Password
    Login Should Show Error    standard_user    ${EMPTY}    ${PASSWORD_REQUIRED_ERROR}

Whitespace Username Is Rejected
    Login Should Show Error    ${SPACE}    ${VALID_PASSWORD}    ${INVALID_CREDENTIALS_ERROR}

Whitespace Password Is Rejected
    Login Should Show Error    standard_user    ${SPACE}    ${INVALID_CREDENTIALS_ERROR}

Single Character Username Is Rejected
    Login Should Show Error    a    ${VALID_PASSWORD}    ${INVALID_CREDENTIALS_ERROR}

Single Character Password Is Rejected
    Login Should Show Error    standard_user    a    ${INVALID_CREDENTIALS_ERROR}

Long Username Is Rejected
    ${username}=    Evaluate    "x" * 256
    Login Should Show Error    ${username}    ${VALID_PASSWORD}    ${INVALID_CREDENTIALS_ERROR}

Long Password Is Rejected
    ${password}=    Evaluate    "x" * 256
    Login Should Show Error    standard_user    ${password}    ${INVALID_CREDENTIALS_ERROR}

Username With Surrounding Whitespace Is Rejected
    Login Should Show Error    ${SPACE}standard_user${SPACE}    ${VALID_PASSWORD}    ${INVALID_CREDENTIALS_ERROR}

Password With Surrounding Whitespace Is Rejected
    Login Should Show Error    standard_user    ${SPACE}${VALID_PASSWORD}${SPACE}    ${INVALID_CREDENTIALS_ERROR}

Special Character Credentials Are Rejected
    Login Should Show Error    user!@example.com    pa$$word!    ${INVALID_CREDENTIALS_ERROR}

*** Keywords ***
Login Should Succeed
    [Arguments]    ${username}    ${password}
    Login To SauceDemo    ${username}    ${password}
    Wait Until Page Contains Element    css=.inventory_list    15s
    Page Should Contain    Products

Login Should Show Error
    [Arguments]    ${username}    ${password}    ${expected_error}
    ${actual_error}=    Login With Invalid Credentials    ${username}    ${password}
    Should Be Equal    ${actual_error}    ${expected_error}
    Login Page Should Be Open