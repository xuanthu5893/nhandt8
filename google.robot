*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
[AUD_01]- Tìm kiếm từ khoá MSB đầu tiên
    Truy cập google.com    https://www.google.com/    chrome
    Tìm kiếm từ khoá "MSB"    //textarea[@id="APjFqb"]    MSB
    click vào kết quả tìm kiếm đầu tiên    1
    tắt Popup
    verify trang có chứa Chọn thẻ phù hợp với bạn    Chọn thẻ phù hợp với bạn
    sleep    5s

*** Keywords ***
Truy cập google.com  
    [Arguments]    ${url}    ${brower}
    Open Browser    ${url}    ${brower}

Tìm kiếm từ khoá "MSB" 
    [Arguments]     ${locator}    ${text}
    Input Text     ${locator}    ${text}
    Press Keys    ${locator}    ENTER

click vào kết quả tìm kiếm đầu tiên    
    [Arguments]    ${index}
    Click Element    //div[@id="rso"]/div[${index}]//h3[contains(text(),'MSB')]

 tắt Popup
     Wait Until Element Is Visible    //div[@id="fragment-34202-joci"]/div/div/div/span
     Click Element    //div[@id="fragment-34202-joci"]/div/div/div/span

verify trang có chứa Chọn thẻ phù hợp với bạn
  [Arguments]      ${text}
      Page Should Contain Element    //div[contains(text(),'${text}')]
