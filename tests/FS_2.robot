*** Settings ***
Documentation    Flow Control Explaind IF, FOR, Exit, Continue

*** Keywords ***
Check Age
    [Arguments]    ${age}
    IF    ${age} >= 18
        Log    You are eligible to vote.
    ELSE
        Log    You are not eligible to vote.
        
    END

Count Numbers
    [Arguments]    ${count}
    FOR    ${i}    IN RANGE    ${count}
        Log    ${i}
    END

Display Names
    [Arguments]    @{names}
    FOR    ${name}    IN    @{names}
        Log    NAME: ${name}
    END

Display Names with Index
    [Arguments]    @{names}
    FOR    ${index}    ${name}    IN ENUMERATE    @{names}
        Log    Index: ${index}, Name: ${name}
    END

Counter
    [Arguments]    ${count}
    WHILE    ${count} > 0
        Log    ${count}
        ${count} =    Evaluate    ${count} - 1
    END
*** Test Cases ***
check Age Test
    Check Age    20
    Check Age    15

Count Numbers Test
    Count Numbers    5

Display Names Test
    @{names} =    Create List    Ahmed    Hesham    Heikal
    Display Names    @{names}
    
Display Names with Index Test
    @{names} =    Create List    Ahmed    Hesham    Heikal
    Display Names with Index    @{names}
    