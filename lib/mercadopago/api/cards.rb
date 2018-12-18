# frozen_string_literal: true

require '../base'

module MercadoPago
  class Cards < Base
    # Override parent class method
    # Place here main base URL
    def service_url
      'https://api.mercadopago.com'
    end

    # GET /v1/customers/:customer_id/cards
    # It retrieves all cards from a customer
    def retrieve_customer_cards(customer_id)
      response = connection.get customer_cards_endpoint(customer_id) do |req|
        req.params['access_token'] = @access_token
      end
      response = process_response(response)
      OpenStruct.new(success?: true, body: response)
    rescue Faraday::ClientError => exception
      OpenStruct.new(success?: false, message: 'Los datos no son correctos', details: exception.response[:body].to_s)
    rescue Faraday::Error::TimeoutError, Faraday::ConnectionFailed, Timeout::Error => e
      OpenStruct.new(success?: false, message: 'El servidor de mercadopago se encuentra fuera de servicio. Intenta más tarde', details: 'Server timeout')
    end

    private

    def customer_cards_endpoint(customer_id)
      "/v1/customers/#{customer_id}/cards/"
    end
  end
end