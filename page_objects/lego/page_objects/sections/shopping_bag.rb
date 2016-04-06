module Lego
  module PageObjects
    module Sections
      class ShoppingBag < SitePrism::Section

        element :items_in_bag, 'H2'
        element :main_checkout_btn, 'input#btn-submit-cart-1'
        elements :product_detail, 'td.product-detail'

        def select_checkout_from_basket
          main_checkout_btn.click
        end


        section :shopping_bag, Lego::PageObjects::Sections::ShoppingBag
      end
    end
  end
end