*** Settings ***

Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://thetestingworldapi.com/

*** Test Cases ***
TC2
    create session  Get_Student_Details      ${base_url}
    ${response}=     Get On Session     Get_Student_Details     api/studentsDetails
    log to console  ${response}
    log to console  ${response.status_code}
    log to console  ${response.content}


#validation
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal     ${status_code}  200


    ${body}=    convert to string   ${response.content}
    should contain  ${body}     sample string 5

    ${contentTypeValue}=    get from dictionary     ${response.headers}     content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8