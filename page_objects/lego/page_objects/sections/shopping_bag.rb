module Lego
  module PageObjects
    module Sections
      class ShoppingBag < SitePrism::Section

        element :items_in_bag, 'H2'
        elements :product_detail, 'td.product-detail'




        section :shopping_bag, Lego::PageObjects::Sections::ShoppingBag
      end
    end
  end
end