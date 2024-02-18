require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
require_relative './pages/order.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
    @order = OrderPage.new
    @popup = Popup.new
end 


After do |scenario|
    screenshot = page.save_screenshot("reports/screenshot/#{scenario.__id__}.png")
    attach(screenshot,"image/png", "Screenshot")

    #f(scenario.failed?)
        #screenshot = page.save_screenshot("reports/screenshot/temp.png")
        #attach(screenshot,"image/png", "Screenshot")
    #end
end