require_all 'page_objects/**/*.rb'
require_relative '../../page_objects/sections/about_product_details'
module Lego
  module PageObjects
    module Pages
      class ProductDetails < SitePrism::Page
        set_url "http://shop.lego.com/en-GB/Millennium-Falcon-75105"
        set_url_matcher /\/Millennium-Falcon-75105/

        element :main_image, '#product-images #product-zoomview'


        section :about_product_details, Lego::PageObjects::Sections::AboutProductDetails, '#product-details'
        section :top_nav, Lego::PageObjects::Sections::TopNav, '.nav-bar ul#shop-navigation-bar'
        #section :product_tab '#product-tabs'



        def product_details
          ProductDetails.new
        end

      end

    end
  end
end


