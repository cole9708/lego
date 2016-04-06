module Lego
  module PageObjects
    module Sections
      class TopNav < SitePrism::Section

        element :checkout, 'li#shopnav-minibag .lnk-checkout'
        element :no_items, 'li#shopnav-minibag'

        elements :product_result_items, 'ul#product-results li.product-thumbnail.test-product'



        def name
          product_title.text
        end

        def select_item
          product_title.click
        end

        def select_to_checkout
            checkout.click
        end


        section :top_nav, Lego::PageObjects::Sections::TopNav
      end
    end
  end
end

