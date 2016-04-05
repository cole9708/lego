module Lego
  module PageObjects
    class Application

      def initialize
        @pages ={}

      end

      def home
        @pages[:home_page] ||=Lego::PageObjects::Pages::HomePage.new
      end

      def product_details
        @pages[:product_details] ||=Lego::PageObjects::Pages::ProductDetails.new
      end


    end
  end

end