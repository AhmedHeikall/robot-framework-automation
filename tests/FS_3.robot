*** Settings ***
Library    SeleniumLibrary
Documentation    Working With WebElements using Selenium Library

# checkboxes


*** Variables ***
${URL_CHECKBOXES}    https://the-internet.herokuapp.com/checkboxes
${BROWSER}    chrome

${CHECKBOX1}    xpath=//form[@id='checkboxes']/input[1]
${CHECKBOX2}    xpath=//form[@id='checkboxes']/input[2]


*** Keywords ***
Open Browser AND Maximize Window
    [Documentation]    This keyword will open the browser and maximize the window.
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

*** Test Cases ***
Check Checkboxes
    [Documentation]    This test case will check the checkboxes on the page if they are not already checked.
    Open Browser AND Maximize Window    ${URL_CHECKBOXES}    ${BROWSER}
    ${checkbox1_state}=    Get Element Attribute    ${CHECKBOX1}    checked
    Run Keyword If    '${checkbox1_state}'=='true'    
    ...    Log    Checkbox 1 is already checked
    ...    ELSE    Click Element    ${CHECKBOX1}
    
    ${checkbox2_state}=    Get Element Attribute    ${CHECKBOX2}    checked
    Run Keyword If    '${checkbox2_state}'=='true'    
    ...    Log    Checkbox 2 is already checked
    ...    ELSE    Click Element    ${CHECKBOX2}   

    Close Browser 

    