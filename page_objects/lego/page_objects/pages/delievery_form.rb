module Lego
  module PageObjects
    module Pages
      class DelieveryForm < SitePrism::Page
        set_url 'https://shop.lego.com/en-GB/checkout/checkout.jsp'
        set_url_matcher /lego.com\//

        element :main_image, '.grid-row.row-mainstage'


        #section :footer, Base::Footer, '.footer'
        #section :header, Base::Header, '.header'
        #section :delievery, Base::Delievery, '#delivery_seller'
        #section :purchaseModule, Base::PurchaseModule, '.purchase_module'

        section :header, '.lego-global-header' do
          element :logo, '.logo'
          element :search_bar, '.lego-global-search-field'
          element :search_icon_submit, '.lego-global-search-submit'
        end

        def home_page
          HomePage.new
        end

      end

    end
  end
end