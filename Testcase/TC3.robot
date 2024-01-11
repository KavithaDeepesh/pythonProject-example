*** Settings ***

Library         RequestsLibrary
Library         Collections
Library         JSONLibrary

*** Variables ***
${base_url}=    https://thetestingworldapi.com/

*** Test Cases ***
Testcase3
    Create Session     AddData    ${base_url}
    ${body}=           create dictionary       first_name=Trest    middle_name=sdasd    last_name=HHJ    date_of_birth=12/11/1988
    ${response}=       POST on Session    AddData     api/studentsDetails     data=${body}


    Log To Console     ${response.status_code}
    Log To Console     ${response.content}

#Validation
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal     ${status_code}  201

    ${body}=    convert to string   ${response.content}
    should contain  ${body}     Trest

    ${contentTypeValue}=    get from dictionary     ${response.headers}     content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8
