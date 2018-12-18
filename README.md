# Mercado Pago Gem
[![Gem Version](https://badge.fury.io/rb/mercadopago-ruby.svg)](https://badge.fury.io/rb/mercadopago-ruby)
-----
## Index
  - [Installation](#installation)
  * API end-points
    - [Clients](#clients)
      * Create a customer
      * Search a customer by email
    - [Cards](#cards)
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
## Cards
