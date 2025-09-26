*** Comments ***
Como um cliente da loja virtual de produtos
Eu quero adicionar produtos em um carrinho de compras
Para que eu possa realizar uma compra


*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${URL}                https://www.saucedemo.com/v1/inventory.html
${PRODUCT_1}          xpath=//*[@id="inventory_container"]/div/div[1]/div[3]/button
${PRODUCT_2}          xpath=//*[@id="inventory_container"]/div/div[2]/div[3]/button
${CART_BUTTON}        xpath=//*[@id="shopping_cart_container"]/a
${CHECKOUT_BUTTON}    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
${INPUT_FIRSTNAME}    xpath=//*[@id="first-name"]
${INPUT_LASTNAME}     xpath=//*[@id="last-name"]
${INPUT_ZIPCODE}      xpath=//*[@id="postal-code"]
${CONTINUE_BUTTON}    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input
${LABEL_TOTAL}        xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[5]
${FINISH_BUTTON}      xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
${SUCCESS_MESSAGE}    xpath=//*[@id="checkout_complete_container"]/h2


*** Test Cases ***
Adicionar produtos no carrinho de compras com sucesso
    [Documentation]     Adiciona 2 produtos no carrinho e finaliza a compra
    Open Browser                    ${URL}                chrome
    Click Button                    ${PRODUCT_1}
    Click Button                    ${PRODUCT_2}
    Click Button                    ${CART_BUTTON}
    Wait Until Element Is Visible   ${CHECKOUT_BUTTON}
    Click Button                    ${CHECKOUT_BUTTON}
    Wait Until Element Is Visible   ${INPUT_FIRSTNAME}
    Input Text                      ${INPUT_FIRSTNAME}    Sergio
    Input Text                      ${INPUT_LASTNAME}     Mendes
    Input Text                      ${INPUT_ZIPCODE}      20040007
    Click Button                    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible   ${LABEL_TOTAL}
    Element Should Contain          ${LABEL_TOTAL}        Item total: $39.98
    Click Button                    ${FINISH_BUTTON}
    Wait Until Element Is Visible   ${SUCCESS_MESSAGE}
    Element Should Contain          ${SUCCESS_MESSAGE}    THANK YOU FOR YOUR ORDER



