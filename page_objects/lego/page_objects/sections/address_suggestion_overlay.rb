module Lego
  module PageObjects
    module Sections
      class AddressSuggestionOverlay < SitePrism::Section

        # element :suggestion_button, 'input#qasRefinementSubmit.btn-big.orange.test-acceptQASSuggestion'
        element :suggestion_button, 'form#qasRefinementForm #qasRefinementSubmit'

        def select_suggestion_address
          suggestion_button.click
        end
      end
    end
  end
end


