require 'rspec'

class Popup
    include Capybara::DSL
    include RSpec::Matchers

    def popup
        popup = find('.swal2-html-container')
        expect(popup.text).to eql text
    end
        
end