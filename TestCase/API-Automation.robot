*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***

API 1: Get All Products List
    ${response}=    GET    https://automationexercise.com/api/productsList

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${body}    Polo
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 2: POST To All Products List
    ${response}=    POST    https://automationexercise.com/api/productsList
    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}

API 3: Get All Brands List
    ${response}=    GET    https://automationexercise.com/api/brandsList

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Should Contain    ${body}    Polo
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 4: PUT To All Brands List
    ${response}=    PUT    https://automationexercise.com/api/brandsList

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 5: POST To Search Product
    ${body}=    Create Dictionary    search_product=top
    ${response}=    POST    https://automationexercise.com/api/searchProduct    data=${body}

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 6: POST To Search Product without search_product parameter
    ${response}=    POST    https://automationexercise.com/api/searchProduct

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Log To Console    ${body}
    Should Contain    ${body}    "responseCode": 400
    Should Contain    ${body}    "message": "Bad request, search_product parameter is missing in POST request."
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 7: POST To Verify Login with valid details
    ${body}=    Create Dictionary    email=testingAT@yopmail.com    password=testingAT
    ${response}=    POST    https://automationexercise.com/api/verifyLogin    data=${body}

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 8: POST To Verify Login without email parameter
    ${body}=    Create Dictionary    password=testing
    ${response}=    POST    https://automationexercise.com/api/verifyLogin    data=${body}

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Log To Console    ${body}
    Should Contain    ${body}    "responseCode": 400
    Should Contain    ${body}    "message": "Bad request, email or password parameter is missing in POST request."
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 9: DELETE To Verify Login
    ${response}=    DELETE    https://automationexercise.com/api/verifyLogin

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Log To Console    ${body}
    Should Contain    ${body}    "responseCode": 405
    Should Contain    ${body}    "message": "This request method is not supported."
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 10: POST To Verify Login with invalid details
    ${body}=    Create Dictionary    email=testingATZ@yopmail.com    password=testingATZ
    ${response}=    POST    https://automationexercise.com/api/verifyLogin    data=${body}

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Log To Console    ${body}
    Should Contain    ${body}    "responseCode": 404
    Should Contain    ${body}    "message": "User not found!"
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8

API 11: POST To Create/Register User Account
    ${body}=    Create Dictionary    name=TestingQA    email=testingAT2@yopmail.com    password=testingAT2    title=MR.Adit    birth_date=27    birth_month=05    birth_year=1996    firstname=Testing    lastname=QA    company=testing    address1=testing    address2=testingdulu    country=testing    zipcode=13213    state=test    city=tesst    mobile_number=0812321312
    ${response}=    POST    https://automationexercise.com/api/createAccount    data=${body}

    #Validation
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${status_code}
    ${body}=    Convert To String   ${response.content}
    Log To Console    ${body}
    Should Contain    ${body}    "responseCode": 400
    Should Contain    ${body}    "message": "Email already exists!"
    ${contentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${contentTypeValue}    text/html; charset=utf-8


