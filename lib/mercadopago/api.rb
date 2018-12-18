# frozen_string_literal: true

require 'api/cards'
require 'api/clients'

module MercadoPago
  module API
    include MercadoPago::Cards
    include MercadoPago::Clients
  end
end
