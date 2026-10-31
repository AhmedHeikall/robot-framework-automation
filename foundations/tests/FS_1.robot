*** Settings ***
Library           SeleniumLibrary

Documentation    Robot Framework automation suite for SauceDemo UI testing with SeleniumLibrary.

# Test Setup and Teardown   
# This will run before and after each test case in the suite.
Test Setup       Open Browser And Navigate To HomePage    ${HOME_PAGE_URL}
Test Teardown    Close Browser

Test Tags    regression

*** Variables ***
${HOME_PAGE_URL}    https://www.saucedemo.com
${VALID_USERNAME}   standard_user
${VALID_PASSWORD}   secret_sauce
${BROWSER}          chrome
${expected_error_message_invalid_credentials}=    Epic sadface: Username and password do not match any user in this service
${expected_error_message_empty_credentials}=    Epic sadface: Username is required


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
    [Tags]    smoke
    Login    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Page Contains Element    css=[class="inventory_list"]
    wait Until Page Contains    Products

Login With InValid Credentials
    [Documentation]    This test case logs in with Invalid credentials and verifies Error Message and user can not login.
    [Tags]    smoke
    Login    username=invaliduser    password=invalidpass   
    ${actual_error_message} =     Get Text    xpath=//div[@class="error-message-container error"]/h3[@data-test="error"]
    # Log    ${actual_error_message}
    Should Be Equal    ${actual_error_message}    ${expected_error_message_invalid_credentials}    

Login With Empty Credentials
    [Documentation]    This test case logs in with empty credentials and verifies Error Message and user can not login.
    Login    username=    password=   
    ${actual_error_message} =     Get Text    xpath=//div[@class="error-message-container error"]/h3[@data-test="error"]
    Should Be Equal    ${actual_error_message}    ${expected_error_message_empty_credentials}