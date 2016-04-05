module Lego
  module PageObjects
    module Pages
      class ProductDetails < SitePrism::Page
        set_url "/Millennium-Falcon-75105"
        set_url_matcher /notonthehighstreet.com\//

        element :product_title, '.product-title'
        element :main_image, '#image_item'


        #section :footer, Base::Footer, '.footer'
        #section :header, Base::Header, '.header'
        #section :delievery, Base::Delievery, '#delivery_seller'
        #section :purchaseModule, Base::PurchaseModule, '.purchase_module'

        section :no_image, '.no-image-wrapper' do
          element :image, '.image'
          element :message, '.text'
        end

        section :guideline_daily_amounts, 'section.gda' do
          element :summary, '.summary'
          element :reference, '.reference'
          elements :tombstones, 'li.gda-item'
          elements :tombstone_titles, '.title'

        end

        def product_details
          ProductDetails.new
        end

      end

    end
  end
end


