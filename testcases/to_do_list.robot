*** Settings ***
Resource          ../keywords/to_do_list_page.robot

*** Test Cases ***
TC_01 User add item to to do list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input '' into new task text box
    When I click add new task
    Then new task textbox is clear
    And I go to To Do task tab
    And My task '' is exist in To Do tab

TC_02 User Move item from to do to complete successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input '' into new task text box
    And I click add new task
    And I go to To Do task tab
    And I checked to complete my task
    And I go to Completed task tab
    Then I saw my task '' in Completed task tab

TC_03 User Remove item from To do list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input '' into new task text box
    When I click add new task
    Then new task textbox is clear
    And I go to To Do task tab
    And My task '' is exist in To Do tab

TC_04 User Remove item from Complete list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input '' into new task text box
    When I click add new task
    Then new task textbox is clear
    And I go to To Do task tab
    And My task '' is exist in To Do tab