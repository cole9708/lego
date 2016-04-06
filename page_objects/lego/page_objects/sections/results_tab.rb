module Lego
  module PageObjects
    module Sections
        class ResultsTab < SitePrism::Section

          element :product_title, 'H4 a'

          elements :product_result_items, 'ul#product-results li.product-thumbnail.test-product'



          def name
            product_title.text
          end

          def select_item
            product_title.click
          end


          section :results_tab, Lego::PageObjects::Sections::ResultsTab
      end
    end
  end
end

