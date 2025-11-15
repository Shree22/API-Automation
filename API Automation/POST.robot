*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
POST API Testcase
    Create Session    mysession    ${BASE_URL}
    
    ${body}=    Create Dictionary    userId=1    title=Test Post    body=This is a sample post created using Robot Framework
    ${headers}=    Create Dictionary    Content-Type=application/json
    
    ${response}=    POST On Session    mysession    /posts    json=${body}    headers=${headers}
    
    Log To Console    Response Status: ${response.status_code}
    Log To Console    Response Body: ${response.text}
    
    Should Be Equal As Integers    ${response.status_code}    201

GET API Testcases
    Create Session    alias    url
