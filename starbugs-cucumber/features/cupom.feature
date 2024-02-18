#language: pt


Funcionalidade: Cupom de desconto no checkout
    Como um usuário do site de venda de cafés, 
    Eu quero poder aplicar cupons de desconto na página de checkout, 
    Para que eu possa obter reduções no preço de produtos específicos ou na minha compra total, aumentando a satisfação com a minha experiência de compra.

Contexto: 

    Dado   que iniciei a compra do item:
        
            | name     |Café com Leite|
            | price    |R$ 19,99      |
            | delivery |R$ 10,00      |
            | total    |R$ 29,99      |


Cenário: Aplicar Desconto de 20%

    Quando  aplico o seguinte cupom: "MEUCAFE"
    Então   o valor final da compra deve ser atualizado para "R$ 25,99"

Esquema do Cenário: Tentativa de aplicar o desconto

    Quando  aplico o seguinte cupom: "<cupom>"
    Então   devo ver a notificação "<saída>"
    E       o valor final da compra deve ser o mesmo

Exemplos:
|cupom      |   saída       |
|PROMO20    |Cupom expirado!|
|PROMO100   |Cupom inválido!|
