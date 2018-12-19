# Mercado Pago Gem
[![Gem Version](https://badge.fury.io/rb/mercadopago-ruby.svg)](https://badge.fury.io/rb/mercadopago-ruby)
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
    @client.search_customers_by_email(email: 'customer@mail.com')
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
  - Retrieve customer cards
  ```ruby
    @client = MercadoPago::API::Cards.new(access_token: ACCESS_TOKEN)
    @client.retrieve_customer_cards(CUSTOMER_ID)
  ``` 
