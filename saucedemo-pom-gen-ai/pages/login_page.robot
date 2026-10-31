*** Settings ***
Library           SeleniumLibrary
Documentation     Locators and actions for the SauceDemo login page.

*** Variables ***
${LOGIN_LOGO}                 css=.login_logo
${USERNAME_INPUT}             id=user-name
${PASSWORD_INPUT}             id=password
${LOGIN_BUTTON}               id=login-button
${LOGIN_ERROR_MESSAGE}        css=[data-test="error"]
${ACCEPTED_USERNAMES}         css=.login_credentials
${SHARED_PASSWORD}            css=.login_password

*** Keywords ***
Login Page Should Be Open
    Wait Until Page Contains Element    ${LOGIN_LOGO}
    Wait Until Page Contains Element    ${USERNAME_INPUT}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}
    Wait Until Page Contains Element    ${LOGIN_BUTTON}

Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_INPUT}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login

Get Login Error Message
    Wait Until Element Is Visible    ${LOGIN_ERROR_MESSAGE}
    ${message}=    Get Text    ${LOGIN_ERROR_MESSAGE}
    RETURN    ${message}

