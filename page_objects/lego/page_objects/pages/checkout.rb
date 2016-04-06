module Lego
  module PageObjects
    module Pages
      class Checkout < SitePrism::Page
        set_url '/cart/shoppingCart.jsp'
        set_url_matcher /\/cart\/shoppingCart.jsp/

        element :title, '#main #column-1 .page-header-icon'


        #section :footer, Base::Footer, '.footer'
        #section :header, Base::Header, '.header'
        #section :delievery, Base::Delievery, '#delivery_seller'
        #section :purchaseModule, Base::PurchaseModule, '.purchase_module'

        section :shopping_bag, Lego::PageObjects::Sections::ShoppingBag, '#shopping-bag-section'


        def checkout
          Checkout.new
        end

      end

    end
  end
end
