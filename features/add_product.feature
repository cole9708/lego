@add_to_basket
Feature: As a Customer
  I want to be able to add items to my basket
  So that I can purchase them

  Scenario: Ensure user is on the correct page
    Given I navigate to legos homepage
    Then the main image should be displayed

  Scenario: search for item
    Given I navigate to legos homepage
    When I search for Millennium item
    Then I should be taken to the search results page

  Scenario: take to product details page
    Given I am on the search results page for Millennium
    When I select the product the product on the search results page
    Then I should be taken to the product details page

  Scenario:
    Given I Navigate to the Millennium product details page
    When I select to add the item to the basket
    Then the item is added to the basket

  Scenario: select to checkout item
    Given I have the Millennium product in my basket
    When I select to checkout
    Then I should be taken to the checkout page
    And the Millennium item should be in the basket

  Scenario: basket checkout
    Given I have the Millennium product in my basket
    And I navigate to the basket page
    When I select to checkout from the basket
    Then sign in overlay is displayed

  Scenario: checkout as guest user
    Given I have the Millennium product in my basket
    When I select to checkout as a guest user
    Then I should be taken to the delivery form page
@submit_address
  Scenario: enter address delivery details
    Given I have checked out from the basket
    When I have entered valid delivery details
    And submit the delivery address
    Then no delivery address errors should be displayed
    And I submit payment details

  Scenario: enter address delivery details
    Given I have checked out from the basket
    When I have entered invalid delivery details
    And submit the delivery address
    Then a delivery address errors should be displayed


  Scenario Outline: multiple locales
    Given I want to load the site using <country> locale
    When I search for Millennium item
    Then I should be taken to the search results page
  Examples:
    | country |
    | lego_gb |
    | lego_de |







