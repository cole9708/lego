module Lego
  module PageObjects
    module Sections
      class AboutProductDetails < SitePrism::Section

        element :product_title, '.product-title'
        element :add_to_cart, 'button#addToCart'

        elements :product_result_items, 'ul#product-results li.product-thumbnail.test-product'


        def name
          product_title.text
        end



        section :about_product_details, Lego::PageObjects::Sections::AboutProductDetails
      end
    end
  end
end