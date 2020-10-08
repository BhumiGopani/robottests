*** Settings ***
Documentation     Home page test cases
Test Setup        Open the automationintesting application
Test Teardown     Close the Browser
Resource          booking.keywords.robot
Resource          booking.page.robot
Resource          ../../variables.robot
Resource          ../common.keywords.robot

*** Test Cases ***
User should be able to book the travelling query
    [Tags]    Smoke
    User should be able to view Hotel-Logo
    User should be able to view Single room details
    Add details under - Name
    Add details under - Email
    Add details under - Phone
    Add details under - Subject
    Add details under - Message
    Click on Submit
    Verify the booking has been done sucessfully


