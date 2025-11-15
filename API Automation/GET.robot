*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
GET Example
    [Documentation]    Example of a GET request using RequestsLibrary
    Create Session    mysession    ${BASE_URL}
    ${response}=    Get Request    mysession    /posts/1
    Log To Console    Status Code: ${response.status_code}
    Log To Console    Response Body: ${response.text}=
    Should Be Equal As Integers    ${response.status_code}    200