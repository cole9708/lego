module Lego
  module PageObjects
    module Sections
        class ResultsTab < SitePrism::Section

          elements :product_result_items, '.product-results'

          section :results_tab, Lego::PageObjects::Sections::ResultsTab
      end
    end
  end
end

