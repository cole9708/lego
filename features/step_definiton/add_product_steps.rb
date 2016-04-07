Given(/^I navigate to legos homepage$/) do
  @app.home.load
end

Given(/^I navigate to product page$/) do
  @app.product_details.load
end

Then (/^the main image should be displayed$/) do
  expect(@app.home).to have_main_image
end

When(/^I search for (.+) item$/) do |search_term|
  @search_term = GenericHelpers.product_configs['product_type'][search_term] || search_term
  @app.home.header.search_bar.set @search_term
  @app.home.header.search_icon_submit.click
end

Given(/^I want to load the site using (.+) locale$/) do |locale|
  @locale = GenericHelpers.locale_configs[locale] || locale
  $BASE_URL = @locale['url']
  Capybara.app_host = @locale['url']
  @app.home.load
end

Given (/^I am on the search results page for (.+)$/) do |search_term|
  @app.home.load
  @search_term = GenericHelpers.product_configs['product_type'][search_term] || search_term
  @app.home.header.search_bar.set @search_term
  @app.home.header.search_icon_submit.click
  @app.search_results.results_tab.wait_for_product_result_items
  expect(@app.search_results.results_tab.product_result_items.size < 2).to eql true
  @app.search_results.results_tab.product_result_items.each do |result|
    # expect(result.text).to include(@search_term.gsub('-',' '))
    result.text.should include('Millennium')
  end
end

Then (/^I should be taken to the search results page$/) do
  sleep 2
  expect(@app.search_results).to be_displayed
end

Then (/^I should be taken to the product details page$/) do
  sleep 2
  expect(@app.product_details).to be_displayed
end

When(/^I select the product the product on the search results page$/) do
  @app.search_results.results_tab.select_item

end

Given (/^I Navigate to the Millennium product details page$/) do
  @app.product_details.load
  @app.product_details.about_product_details.wait_for_add_to_cart
  @items_in_basket = @app.product_details.top_nav.no_items.text.scan(/\d+/)
end

When (/I select to add the item to the basket$/) do
  @app.product_details.about_product_details.wait_for_add_to_cart
  @app.product_details.about_product_details.add_to_cart.click
  sleep 3
  @app.product_details.top_nav.wait_for_checkout
  @current_items_in_basket = @app.product_details.top_nav.checkout.text.scan(/\d+/)

end

Then (/^the item is added to the basket$/) do
  expect(@items_in_basket).to_not eql @current_items_in_basket
end

Given (/^I have the Millennium product in my basket$/) do
  @app.product_details.load
  @app.product_details.about_product_details.wait_for_add_to_cart
  @items_in_basket = @app.product_details.top_nav.no_items.text.scan(/\d+/)
  #@app.product_details.about_product_details.wait_for_add_to_cart
  @app.product_details.about_product_details.add_to_cart.click
  sleep 3
  @app.product_details.wait_for_top_nav
  @app.product_details.top_nav.wait_for_checkout
  @current_items_in_basket = @app.product_details.top_nav.checkout.text.scan(/\d+/)
  expect(@items_in_basket).to_not eql @current_items_in_basket
end

When (/^I select to checkout$/) do
  @app.product_details.top_nav.select_to_checkout
end

Then (/^I should be taken to the checkout page$/) do
  sleep 2
  expect(@app.checkout).to be_displayed
end

Given (/^I navigate to the basket page$/) do
  @app.checkout.load
end

And (/^the Millennium item should be in the basket$/) do
  my_items =@app.checkout.shopping_bag.product_detail.each { |item| puts item }
  expect(my_items.first.text).to include 'Millennium Falcon'
end

When (/^I select to checkout from the basket$/) do
  @app.checkout.shopping_bag.select_checkout_from_basket
end

Then (/^sign in overlay is displayed$/) do
  @app.checkout.wait_for_checkout_overlay
  expect(@app.checkout).to have_checkout_overlay
end

When (/^I select to checkout as a guest user$/) do
  @app.checkout.load
  @app.checkout.shopping_bag.select_checkout_from_basket
  @app.checkout.checkout_overlay.select_guest
end

Then(/^I should be taken to the delivery form page$/) do
  sleep 2
  expect(@app.delivery_form).to be_displayed
end

When(/^I have entered (.+) delivery details$/) do |user_type|
  if user_type =='valid' then
    sleep 2
    @app.delivery_form.set_valid_user_details
  else
    if user_type == 'invalid'
      sleep 2
      @app.delivery_form.set_invalid_user_details
    else
      puts "user type details are not held on the system"
    end
  end
end

Given(/^I have checked out from the basket$/) do
  @app.product_details.load
  @app.product_details.about_product_details.wait_for_add_to_cart
  @app.product_details.about_product_details.add_to_cart.click
  sleep 2
  @app.product_details.top_nav.wait_for_checkout
  @app.product_details.top_nav.select_to_checkout
  sleep 3
  @app.checkout.shopping_bag.select_checkout_from_basket
  @app.checkout.checkout_overlay.select_guest
end

When (/^submit the delivery address$/) do
  @app.delivery_form.submit_delivery_details.click
  sleep 2
end

Then (/^a delivery address errors should be displayed$/) do
  expect(@app.delivery_form).to have_delivery_error
end

Then (/^no delivery address errors should be displayed$/) do
  expect(@app.delivery_form).to_not have_delivery_error
end

Then(/^I select suggestion delivery address$/) do
  @app.delivery_form.address_suggestion_overlay.select_suggestion_address
end

Then(/^select delivery checkbox$/) do
  @app.delivery_form.set_billing_check
end

And (/^I submit payment details$/) do
  @app.delivery_form.wait_for_address_suggestion_overlay
  FormHelpers.submit_form
  @app.delivery_form.address_suggestion_overlay.select_suggestion_address
  @app.delivery_form.set_billing_check
  @app.delivery_form.set_billing_email
  @app.delivery_form.set_card_details
  @app.delivery_form.pay_now.click
  sleep 1
  @app.delivery_form.submit_billing.click
end






