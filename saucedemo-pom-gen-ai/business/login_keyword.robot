*** Settings ***
Documentation     Business-level workflows for SauceDemo login tests.
Resource          ../core/browser.robot
Resource          ../pages/login_page.robot

*** Keywords ***
Open SauceDemo Login Page
    [Arguments]    ${url}    ${browser}
    Open Browser To Login Page    ${url}    ${browser}
    Login Page Should Be Open

Login To SauceDemo
    [Arguments]    ${username}    ${password}
    Login Page Should Be Open
    Login With Credentials    ${username}    ${password}

Login With Valid Credentials
    [Arguments]    ${username}    ${password}
    Login To SauceDemo    ${username}    ${password}

Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Login To SauceDemo    ${username}    ${password}
    ${error_message}=    Get Login Error Message
    RETURN    ${error_message}

Close SauceDemo Browser
    Close Browser