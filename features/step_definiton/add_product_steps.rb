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
end

Then (/^I should be taken to the search results page$/)do
  binding.pry
  expect(@app.search_results).to be_displayed
 # expect(@app.search_results).to have_search_title
  binding.pry
end
