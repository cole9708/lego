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

Given (/^I am on the search results page for (.+)$/)do|search_term|
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

Then (/^I should be taken to the search results page$/)do
  expect(@app.search_results).to be_displayed
end

Then (/^I should be taken to the product details page$/)do
  expect(@app.product_details).to be_displayed
end

When(/^I select the product the product on the search results page$/)do
  @app.search_results.results_tab.select_item

end

Given (/^I Navigate to the millenium product details page$/)do
  @app.product_details.load
  @app.product_details.about_product_details.wait_for_add_to_cart
  @items_in_basket = @app.product_details.top_nav.no_items.text.scan(/\d+/)
end

When (/I select to add the item to the basket$/)do
  @app.product_details.about_product_details.wait_for_add_to_cart
  @app.product_details.about_product_details.add_to_cart.click
  @current_items_in_basket = @app.product_details.top_nav.checkout.text.scan(/\d+/)

end

Then (/^the item is added to the basket$/)do
  expect(@items_in_basket).to_not eql @current_items_in_basket
end




