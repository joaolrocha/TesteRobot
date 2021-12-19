*** Settings ***
Library     SeleniumLibrary
Resource     ./Saucedemo.resource
Test Setup     Abrir o site da loja Sauce Demo

*** Test Cases ***
Processo de compra na loja Sauce Demo
  Fazer login
  Selecionar um produto para visualizar os detalhes
  Colocar o produto no carrinho
  Acessar o carrinho e clicar em Checkout
  Preencher dados do cliente
  Clicar em finalizar e validar compra concluida