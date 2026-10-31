*** Settings ***
Library    SeleniumLibrary    
Library    Collections


*** Variables ***
${DEFAULT_TIMEOUT}    5s

*** Keywords ***
Open Browser To Login Page
    [Arguments]    ${url}    ${BROWSER}
    Open Browser    ${url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}

Close Browser
    SeleniumLibrary.Close Browser