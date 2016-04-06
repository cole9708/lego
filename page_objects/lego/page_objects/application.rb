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

      def about_product_details
        @sections[:about_product_details] ||=Lego::PageObjects::Sections::AboutProductDetails.new
      end

      def top_nav
        @sections[:top_nav] ||=Lego::PageObjects::Sections::TopNav.new
      end

      def shopping_bag
        @sections[:shopping_bag] ||=Lego::PageObjects::Sections::ShoppingBag.new
      end

      def checkout
        @pages[:checkout] ||=Lego::PageObjects::Pages::Checkout.new
      end

      def delivery_form
        @pages[:delivery_form] ||=Lego::PageObjects::Pages::DeliveryForm.new
      end

      def checkout_overlay
        @sections[:checkout_overlay] ||=Lego::PageObjects::Pages::CheckoutOverlay.new
      end

      def address_suggestion_overlay
        @sections[:address_suggestion_overlay] ||=Lego::PageObjects::Pages::AddressSuggestionOverlay.new
      end
      #def lefthandnav
       # @sections[:lefthandnav] ||=Lego::PageObjects::Sections::LeftHandNav.new
      #end

    end
  end

end