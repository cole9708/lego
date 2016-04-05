require_all 'page_objects/**/*.rb'
require_relative '../../page_objects/sections/results_tab'

module Lego
  module PageObjects
    module Pages
      class SearchResults < SitePrism::Page
        set_url_matcher /\?q=[\w]*&cc=/


        element :search_title, '.main_search'

        section :results_tab, Lego::PageObjects::Sections::ResultsTab, '.results_main'

      end
    end
  end
end
