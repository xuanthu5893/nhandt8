*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
[ADT01]- Đăng nhập guru99
    [Documentation]    Đăng nhập guru99
    [Tags]    LOGIN_GURU99
    Truy cập vào trang guru99.com    https://demo.guru99.com/test/login.html    chrome
    Nhập vào ô email address   //input[@id="email"]    nhandt@gmail.com
    Nhập vào ô Password   //input[@id="passwd"]    123456
    Click button Sign in    //button[@id="SubmitLogin"]
    Verify màn hình có chứa dòng chữ    Successfully Logged in...
     Sleep     20s


*** Keywords ***

Truy cập vào trang guru99.com    
    [Arguments]   ${url}    ${browser}
    Open Browser    ${url}    ${browser}

Nhập vào ô email address
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Nhập vào ô Password
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Click button Sign in
    [Arguments]    ${Sign_in_btn}
    Click Button    ${Sign_in_btn}
     
Verify màn hình có chứa dòng chữ
    [Arguments]    ${text}
    Wait Until Element Is Visible    //h3[contains(text(),"${text}")]
    Page Should Contain Element    //h3[contains(text(),'${text}')]



