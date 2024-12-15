*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve permitir cadastrar uma tarefa
    
    ${task}    Set Variable    Estudar Python
    Remove task from database    ${task}

    Do login
    Create a new task    ${task}
    Should have task     ${task}

Deve permitir remover uma tarefa indesejada

    #Dado que eu tenho uma tarefa indesejada
    ${task}    Set Variable    Comprar refrigerante

    Remove task from database    ${task}
    
    #E essa foi cadastrada no sistema
    Do login
    Create a new task    ${task}
    Should have task     ${task}

    #Quando eu faço a exclusão dessa tarefa
    Remove task by name                 ${task}
    
    #Então essa tarefa some da tela
    Wait Until Page Does Not Contain    ${task}

Deve permitir concluir uma tarefa
    [Tags]    update

    ${task}    Set Variable    Estudar XPath

    Remove task from database    ${task}
    
    Do login
    Create a new task    ${task}
    Should have task     ${task}

    Finish task by name                ${task}
    Task should be done                ${task}