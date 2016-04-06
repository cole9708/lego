module Lego
  module PageObjects
    module Sections
      class CheckoutOverlay < SitePrism::Section

        element :guest_signIn_btn, 'a#btn-checkout-as-guest'

        def select_guest
          guest_signIn_btn.click
        end



        section :checkout_overlay, Lego::PageObjects::Sections::CheckoutOverlay
      end
    end
  end
end