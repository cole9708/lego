module Lego
  module PageObjects
    class Application

      def initialize
        @pages ={}
        @sections ={}

      end

      def home
        @pages[:home_page] ||=Lego::PageObjects::Pages::HomePage.new
      end

      def product_details
        @pages[:product_details] ||=Lego::PageObjects::Pages::ProductDetails.new
      end

      def search_results
        @pages[:search_results] ||=Lego::PageObjects::Pages::SearchResults.new
      end

      def results_tab
        @sections[:results_tab] ||=Lego::PageObjects::Sections::ResultsTab.new
      end
      #def lefthandnav
       # @sections[:lefthandnav] ||=Lego::PageObjects::Sections::LeftHandNav.new
      #end

    end
  end

end