*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Open Browser
    ${c_opts} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${c_opts}    add_argument    test-type
    Call Method    ${c_opts}    add_argument    disable-infobars
    Call Method    ${c_opts}    add_argument    disable-extensions
    Call Method    ${c_opts}    add_argument    disable-cache
    Create Webdriver    Chrome    crm_alias    chrome_options=${c_opts}
    Set Window Size    1400    900

Go To Do Website
    Go To    https://abhigyank.github.io/To-Do-List/
    wait until page contains element   //*[@id="add-item"]/button    10

Launch To Do Website
    Open Browser
    Go To Do Website

I input '${task_name}' into new task text box
    Wait Until Page Contains Element    css=#new-task
    Input Text    css=#new-task    ${task_name}

I click add new task
    Wait Until Page Contains Element    css=#new-task
    Click Element   css=[class="material-icons"]

new task textbox is clear
    Element text should be    css=#new-task    ${EMPTY}

I go to To Do task tab
    Click Element    //*[contains(text(),'To-Do Tasks')]

My task '${task_name}' is exist in To Do task tab
    Wait Until Page Contains Element    css=#text-1
    Element Text Should Be    css=#text-1    ${task_name}

I checked to complete task '${task_name}'
    Wait Until Page Contains Element    //*[contains(text(),'${task_name}')]
    Click Element   //*[contains(text(),'${task_name}')]

Task '${task_name}' is removed from To do task tab
    Page Should Not Contain    //*[contains(text(),'${task_name}')]

I go to Completed task tab
    Click Element    //*[contains(text(),'Completed')]

I saw my task '${task_name}' in Completed task tab
    Wait Until Page Contains Element    //*[contains(text(),'${task_name}')]
    ${element}=    Set Variable    document.evaluate("//*[contains(text(),'${task_name}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('text-decoration-line');
    Should Be Equal    ${attribute_value}    line-through    Text is not line-through

I delete task from To Do task tab
    Delete first task

I delete task from Complete task tab
    Delete first task

Delete first task
    Click Element    //*[contains(text(),'Delete')]

Task '${task_name}' is removed from Completed task tab
    Page Should Not Contain    //*[contains(text(),'${task_name}')]