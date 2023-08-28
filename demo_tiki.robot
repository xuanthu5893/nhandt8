*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
[AUT_01]- Sản phẩm đầu tiên tìm kiếm được
    Truy cập vào trang    https://tiki.vn/    chrome
    Nhập vào ô tìm kiếm     //input[@data-view-id="main_search_form_input"]    Xe đạp
    Ấn button Tìm kiếm    //button[@data-view-id="main_search_form_button"]
    Nhấn vào sản phẩm thứ     1
    Sleep    20s
    Verify tên sản phẩm có chứa chữ xe đạp     //h1[contains(text(),'XE ĐẠP ĐỊA HÌNH FORNIX FN26')]


*** Keywords ***
Truy cập vào trang
    [Arguments]    ${url}    ${brower}
    Open Browser    ${url}    ${brower}

Nhập vào ô tìm kiếm
    [Arguments]    ${locator}    ${text}
    Input Text   ${locator}    ${text}

Ấn button Tìm kiếm
    [Arguments]    ${tim_kiem_btn}
    Click Element    ${tim_kiem_btn}

Nhấn vào sản phẩm thứ
    [Arguments]    ${index}
    Wait Until Element Is Visible    //div[@data-view-id="product_list_container"]/div[1]
    Click Element    //div[@data-view-id="product_list_container"]/div[${index}]

Verify tên sản phẩm có chứa chữ xe đạp
    [Arguments]    ${text}
    Page Should Contain Element    ${text}


    