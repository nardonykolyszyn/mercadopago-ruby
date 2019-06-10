# Mercado Pago Gem
[![Gem Version](https://badge.fury.io/rb/mercadopago-ruby.svg)](https://badge.fury.io/rb/mercadopago-ruby)
[Official Mercado Pago documentation](https://www.mercadopago.com.ar/developers/es/)
-----
## Index
  - [Installation](#installation)
  * API end-points
    - [Clients](#clients)
      * Search a customer by email
      * Search a customer by any criteria
      * Create a customer
      * Remove customer
      * Update customer
    - [Cards](#cards)
      * Retrieve
------

## Installation
```
  $ gem install mercadopago-ruby
```
    
```ruby
  require 'mercadopago'
```
## Clients
  - Get a customer by email
  ```ruby
    @client = MercadoPago::API::Clients.new(access_token: ACCESS_TOKEN)
    @client.search_customers_by_email('customer@mail.com')
  ``` 
  - Get a customer by any criteria
  ```ruby
    @client.search_by(first_name: 'Peter Khaule')
  ``` 
  - Create a new customer
  ```ruby
    @client.create_customer(email: 'customer@mail.com')
  ``` 
  - Remove customer
  ```ruby
    @client.remove_customer(CUSTOMER_ID)
  ```
  - Update customer
   ```ruby
    payload = {
      first_name: 'Peter Khaule'
    }
    @client.update_customer(CUSTOMER_ID, payload)
   ```
## Cards
  Mercado Pago provides credit cards to being used in the sandbox environment. [See list](https://www.mercadopago.com.ar/developers/es/solutions/payments/custom-checkout/test-cards/)
  - Adding a new card
    Cards should be added using the official Mercado Pago's JS SDK, because risky data should not go through our Backend side, instead, Mercado Pago will return a **card_token** attribute which you can be used to add a new card to an existing customer.
    [How to create a new card](https://www.mercadopago.com.br/developers/en/solutions/payments/custom-checkout/charge-with-creditcard/javascript/)
  - Add a card to an existing customer
     Once you have your **card_token** and you **customer_id** you can associate both, in this way adding a card to an existing customer.
     ```ruby
      @client = MercadoPago::API::Cards.new(access_token: ACCESS_TOKEN)
      @client.add_card_to_customer(CUSTOMER_ID, CARD_TOKEN)
    ```
  - Retrieve customer cards
    ```ruby
      @client.retrieve_customer_cards(CUSTOMER_ID)
    ```
