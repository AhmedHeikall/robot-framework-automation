*** Settings ***
Library           SeleniumLibrary

# Test Setup and Teardown   
# This will run before and after each test case in the suite.
Test Setup       Open Browser And Navigate To HomePage    ${HOME_PAGE_URL}
Test Teardown    Close Browser

*** Variables ***
${HOME_PAGE_URL}    https://www.saucedemo.com
${VALID_USERNAME}   standard_user
${VALID_PASSWORD}   secret_sauce
${BROWSER}          chrome

*** Keywords ***
Open Browser And Navigate To HomePage
    [Documentation]    This keyword opens a browser and navigates to the specified homePage URL.
    [Arguments]    ${url}
    Open Browser    ${url}   ${BROWSER} 
    Maximize Browser Window

Login 
   [Documentation]    This Keyword is used to login
   [Arguments]    ${username}    ${password}
   Input Text    id=user-name    ${username}
   Input Text    id=password    ${password}
   Click Button    id=login-button

*** Test Cases ***
Open Browser And Verify Title
    [Documentation]    This test case opens a browser, navigates to a homePage URL, and verifies the page title.
    wait Until Page Contains Element    css=[class="login_logo"]

Login With Valid Credentials
    [Documentation]    This test case logs in with valid credentials and verifies successful login.
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    css=[class="inventory_list"]
    wait Until Page Contains    Products

