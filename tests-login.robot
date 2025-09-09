*** Comments ***
Como um usuário cadastrado na aplicação
Eu quero fazer login com a minha conta
Para que eu possa acessar as funcionalidades do sistema


*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${URL}                 https://the-internet.herokuapp.com/login
${USERNAME_FIELD}      xpath=//*[@id="username"]
${PASSWORD_FIELD}      xpath=//*[@id="password"]
${LOGIN_BUTTON}        xpath=//*[@id="login"]/button
${SUCCESS_MESSAGE}     xpath=//*[@id="flash"]


*** Test Cases ***
Autenticação de usuário com sucesso
    [Documentation]     Realizar a autenticação de um usuário com sucesso
    Open Browser          ${URL}                chrome
    Input Text            ${USERNAME_FIELD}     tomsmith
    Input Password        ${PASSWORD_FIELD}     SuperSecretPassword!
    Click Button                    ${LOGIN_BUTTON}
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE}
    Element Should Contain          ${SUCCESS_MESSAGE}    You logged into a secure area!                                                         
    Capture Page Screenshot
