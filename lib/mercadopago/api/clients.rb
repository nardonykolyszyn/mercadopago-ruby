# frozen_string_literal: true

require_relative '../base_client'

module MercadoPago
  module API
    class Clients < BaseClient

      # Override parent class method
      # Place here main base URL
      def service_url
        'https://api.mercadopago.com'
      end

      def search_customers_by_email(email)
        response = connection.get(customers_search_endpoint, email: email) do |req|
          req.params['access_token'] = @access_token
        end
        response = process_response(response)
        OpenStruct.new(success?: true, body: response)
      rescue Faraday::ClientError => exception
        OpenStruct.new(success?: false, message: 'Bad request', details: exception.response[:body].to_s)
      end

      private

      def customers_search_endpoint
        '/v1/customers/search'
      end
    end
  end
end