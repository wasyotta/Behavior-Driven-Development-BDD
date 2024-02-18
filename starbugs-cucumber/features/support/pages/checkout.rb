require 'rspec'

class CheckoutPage

    include Capybara::DSL
    include RSpec::Matchers

    def assert_product_details(product)

        product_title = find('.item-details')
        expect(product_title.text).to eql product[:name]

        product_price_checkout = find('.subtotal .sub-price')
        expect(product_price_checkout.text).to eql product[:product_price]

        product_delivery_checkout = find('.delivery .delivery-price')
        expect(product_delivery_checkout.text).to eql product[:product_delivery]
    end

    def assert_total_price(total_price)
        price = find(' div .total-price ')
        expect(price.text).to eql total_price
    end

    def find_zipcode(zipcode)
        find('input[name="cep"]').set(zipcode)
        click_on('Buscar CEP')
    end

    def fill_address(address)
        find("input[name='number']").set(address[:Number])
        find("input[name='complement']").set(address[:Details])
    end

    def choice_payment(payment_type)
        find('label div ', text: payment_type.upcase).click
    end

    def submit
        click_on 'Confirmar pedido'
    end

    def set_coupon(coupon_code)
        find('input[placeholder="Código do cupom"]').set(coupon_code)
        click_on 'Aplicar'
    end

    def assert_notice(text)
        notice = find('.notice').text
        expect(notice).to eql (text) 
    end
end