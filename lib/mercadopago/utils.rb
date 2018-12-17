# frozen_string_literal: true

require '../http_client/http_client'

BASE_URL = ''

module MercadoPago
  module Utils
    def perform_request
      request = HttpClient.new()
      request
    end
  end
end