*** Settings ***
Library           SeleniumLibrary

*** Variables ***

*** Keywords ***
Open the application
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    disable-infobars
    Call Method    ${chrome_options}    add_argument    start-maximized
    Call Method    ${chrome_options}    add_argument    enable-automation
    Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    --dns-prefetch-disable
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}
    #    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Click on next button untill user is on home page
    Click Element   //*[@id="next"]
    Click Element   //*[@id="next"]
    Click Element   //*[@id="next"]
    Click Element   //*[@id="next"]
    Click Element   //*[@id="closeModal"]

User should be able to view Hotel-Logo
    Wait Until Element Is Visible   //*[@class="hotel-logoUrl"]

User should be able to view Single room details
    Wait Until Element Is Visible   //*[@class="row hotel-room-info"]

Add details under - Name
    Wait Until Element Is Visible    id=name   timeout=60
    Input Text    id=name    Test

Add details under - Email
    Wait Until Element Is Visible    id=email   timeout=60
    Input Text    id=email    test@gmail.com

Add details under - Phone
    Wait Until Element Is Visible    id=phone   timeout=60
    Input Text    id=phone    01234512345

Add details under - Subject
    Wait Until Element Is Visible    id=subject   timeout=60
    Input Text    id=subject    test_subject

Add details under - Message
    Wait Until Element Is Visible    id=description   timeout=60
    Input Text    id=description    test_messagetest_messagetest_message

Click on Submit
    Click Element   //*[@id="submitContact"]

Verify the booking has been done sucessfully
    Wait Until Element Is Visible    //*[contains(text(),'Thanks for getting in touch ')]
