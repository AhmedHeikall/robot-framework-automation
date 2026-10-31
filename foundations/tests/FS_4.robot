*** Settings ***
Documentation    Read and validate a heading from the embedded iframe.
Library           SeleniumLibrary

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers

Test Setup        Wait For Iframe 

*** Variables ***
${URL}                     https://www.globalsqa.com/demo-site/frames-and-windows/#iFrame
${BROWSER}                 chrome
${IFRAME_LOCATOR}          xpath=//iframe[@name="globalSqa"]
${HEADER_LOCATOR}          xpath=//div[@class="header_contacts"]//div[@class="header_mail"]
${TIMEOUT}                 10 seconds

*** Keywords ***
Wait For Iframe 
   Wait Until Element Is Visible    ${IFRAME_LOCATOR}    ${TIMEOUT}

Read Iframe Header
	Select Frame    ${IFRAME_LOCATOR}
	Wait Until Element Is Visible    ${HEADER_LOCATOR}    ${TIMEOUT}
	${header_text}=    Get Text    ${HEADER_LOCATOR}
	Unselect Frame
	RETURN    ${header_text}

*** Test Cases ***
Read Visible Header In Iframe
	${header}=    Read Iframe Header
	Should Not Be Empty    ${header}

Return Header Text From Iframe
	${header}=    Read Iframe Header
	Log    Iframe header value: ${header}
	Should Not Be Empty    ${header}



