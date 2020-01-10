*** Settings ***
Documentation
...    Para que eu possa conhecer devs e qas com skills em comum
...    Sendo um usuário que possui uma conta no GitHub
...    Quero poder iniciar uma nova sessão

Resource    ../resources/steps.robot

Test Setup      Abrir Navegador
Test Teardown   Fechar Browser

*** Test Cases ***

Nova sessao
    Dado que possuo a conta "wesleylimabh"
    E possuo os skills "java, python, javascript"
    Quando eu entro no gitnder
    Então devo ver a area logada

Conta github incorreta
    [Template]  Tentativa de login
    wesleylimabetim

Conta nao informada
    [Template]  Tentativa de login
    ${EMPTY}

*** Keywords ***
Tentativa de login
    [Arguments]     ${conta}
    Dado que possuo a conta "${conta}"
    Quando eu entro no gitnder
    Entao devo ver a mensagem de alerta: "Conta Github não existe :("