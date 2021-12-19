*** Variables ***
${SITE}               http://saucedemo.com
${NAVEGADOR}          Chrome
${CAMPO_USUARIO}       css=#user-name
${USUARIO}             standard_user
${CAMPO_SENHA}         css=#password
${SENHA}               secret_sauce
${BOTAO_LOGUIN}        css=#login-button
${PRODUTO}             css=#item_4_title_link > div
${ADICIONAR_CARRINHO}  css=#add-to-cart-sauce-labs-backpack
${CARRINHO}            css=#shopping_cart_container > a
${CHECKOUT}            css=#checkout
${CAMPO_NOME}          css=#first-name
${CAMPO_SOBRENOME}     css=#last-name
${CAMPO_CEP}           css=#postal-code
${BOTAO_CONTINUE}      css=#continue
${NOME}                nome
${SOBRENOME}           sobrenome
${CEP}                 000000
${BOTAO_FINALIZAR}     css=#finish

*** Keywords ***
Abrir o site da loja Sauce Demo
  Open Browser    ${SITE}   ${NAVEGADOR}
   Maximize Browser Window

Fazer login
  Input Text          ${CAMPO_USUARIO}       ${USUARIO}
  Input Text          ${CAMPO_SENHA}         ${SENHA}
  Wait and Click        ${BOTAO_LOGUIN}

Selecionar um produto para visualizar os detalhes
   Wait and Click            ${PRODUTO}

Colocar o produto no carrinho
   Wait and Click            ${ADICIONAR_CARRINHO}

Acessar o carrinho e clicar em Checkout
   Wait and Click            ${CARRINHO}
   Wait and Click            ${CHECKOUT}

Preencher dados do cliente
   Input Text                ${CAMPO_NOME}        ${NOME}
   Input Text                ${CAMPO_SOBRENOME}   ${SOBRENOME}
   Input Text                ${CAMPO_CEP}         ${CEP}
   Wait and Click            ${BOTAO_CONTINUE}

Clicar em finalizar e validar compra concluida
   Wait and Click            ${BOTAO_FINALIZAR}
   Page Should Contain        THANK YOU FOR YOUR ORDER

#### KEYWORDS PERSONALIZADAS #####

Wait and Click
   [Arguments]                      ${ELEMENTO}
   Wait Until Element is Visible    ${ELEMENTO}
   Click Element                    ${ELEMENTO}