*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
[AUT_01]- Sản phẩm nồi chiên không dầu thứ 4 tìm kiếm đươc
    Truy cập trang Tiki.vn    https://tiki.vn/    chrome
    Tìm kiếm cụm từ nồi chiên     //input[@data-view-id="main_search_form_input"]    nồi chiên
    Click vào nồi chiên không dầu
    Click vào sản phẩm thứ      4    
    Sleep    5s
    Click "Chọn mua"    //button[@data-view-id="pdp_add_to_cart_button"]
    sleep    5s
    Verify popup có chứa "Xin chào"     Xin chào


*** Keywords ***

Truy cập trang Tiki.vn 
    [Arguments]     ${url}    ${browser}
    Open Browser     ${url}    ${browser}

Tìm kiếm cụm từ nồi chiên
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Click vào nồi chiên không dầu
    Wait Until Element Is Visible    //div[(text()='nồi chiên không dầu')]
    Click Element     //div[(text()='nồi chiên không dầu')]

Click vào sản phẩm thứ 
    [Arguments]     ${index}
    Wait Until Element Is Visible     //div[@data-view-id="product_list_container"]/div[${index}]
    Sleep    5s
    Click Element        //div[@data-view-id="product_list_container"]/div[${index}]

 Click "Chọn mua" 
     [Arguments]    ${chon_mua_btn}
     Click Element    ${chon_mua_btn}

Verify popup có chứa "Xin chào"
    [Arguments]    ${text}
    Wait Until Element Is Visible     //h4[contains(text(),'${text}')]
    Page Should Contain Element    //h4[contains(text(),'${text}')]