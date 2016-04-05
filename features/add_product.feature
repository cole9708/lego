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

     Scenario:
       Given I am on the search results page for Millennium
       When I select the product the product on the search results page
       Then I should be taken to the product details page

       Scenario:
         Given I Navigate to the millenium product details page
         When I select to add the item
         Then the item is added to the basket

         Given I navigate to the basket

