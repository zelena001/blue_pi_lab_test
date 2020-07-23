*** Settings ***
Resource          ../keywords/to_do_list_page.robot

*** Test Cases ***
TC_01 User add item to to do list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input 'อะไรก็ได้ test 123' into new task text box
    When I click add new task
    Then new task textbox is clear
    And I go to To Do task tab
    And My task 'อะไรก็ได้ test 123' is exist in To Do task tab

TC_02 User Move item from to do to complete successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input 'อะไรก็ได้ test 123' into new task text box
    And I click add new task
    And I go to To Do task tab
    When I checked to complete task 'อะไรก็ได้ test 123'
    Then Task 'อะไรก็ได้ test 123' is removed from To do task tab
    And I go to Completed task tab
    And I saw my task 'อะไรก็ได้ test 123' in Completed task tab

TC_03 User Remove item from To do list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input 'อะไรก็ได้ test 123' into new task text box
    And I click add new task
    And I go to To Do task tab
    When I delete task from To Do task tab
    Then Task 'อะไรก็ได้ test 123' is removed from To do task tab

TC_04 User Remove item from Complete list successfully
    [Setup]  Launch To Do Website
    [Teardown]  Close Browser
    Given I input 'อะไรก็ได้ test 123' into new task text box
    When I click add new task
    And I go to To Do task tab
    And I checked to complete task 'อะไรก็ได้ test 123'
    And I go to Completed task tab
    When I delete task from Complete task tab
    Then Task 'อะไรก็ได้ test 123' is removed from Completed task tab