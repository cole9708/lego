module Lego
  module PageObjects
    module Pages
      class DeliveryForm < SitePrism::Page
        set_url 'https://shop.lego.com/en-GB/checkout/checkout.jsp'
        set_url_matcher /\/checkout\/checkout.jsp/\


        element :title, 'li#shipping-address-section h2'
        element :first_name_field,  'input.test-shippingFirstName'
        element :last_name_field, 'input.test-shippingLastName'
        element :house_number_field, 'input.test-shippingAddress1'
        element :post_code_field,'input.test-shippingPostalCode'
        element :phone_number_field, 'input.test-shippingPhoneNumber'
        element :submit_delivery_details, 'input#btn-submit-shipping'
        element :delivery_error, 'div.shop-notice.form-error'
        element :same_delivery_checkbox, 'imput#chk-billingSameAsShipping'
        element :billing_email, 'input.billingEmail.test-billingEmail'
        element :card_number, 'input#Paymetric_CreditCardNumber'
        element :card_month, 'input#Paymetric_Exp_Month'
        element :card_year, 'input#Paymetric_Exp_Year'
        element :card_cvv, 'input#Paymetric_CVV'
        element :pay_now, 'input#PayNowButton'
        element :submit_billing, 'input#btn-submit-billing'

        section :address_suggestion_overlay, Lego::PageObjects::Sections::AddressSuggestionOverlay, 'div#shopModalDialogContainer'

        def set_billing_check
          same_delivery_checkbox.set(true)
        end

        def set_billing_email
          billing_email.set 'cole9708@googlemmail.com'
        end

        def set_valid_user_details
          wait_for_first_name_field
          first_name_field.set 'chris'
          last_name_field.set 'cole'
          house_number_field.set '30'
          post_code_field.set 'n18 2ba'
          phone_number_field.set '07984878953'
        end

        def set_card_details
          card_number.set '0000000000000000'
          card_month.set '12'
          card_year.set '16'
          card_cvv.set '123'
        end


        def set_invalid_user_details
          first_name_field.set 'chris'
          last_name_field.set 'cole'
          house_number_field.set '30'
          post_code_field.set 'n18 2ba**12'
          phone_number_field.set '07984878953'
        end




        def delivery_form
          DeliveryForm.new
        end

      end

    end
  end
end