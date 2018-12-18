# frozen_string_literal: true

require 'faraday/request_id'
require 'faraday_middleware'
require './active_support/deep_symbolize_keys'

module MercadoPago
  
  class Base
    using SymbolizeHelper
    def initialize(access_token: '', sandbox: true)
      @access_token = access_token
      @sandbox = sandbox
    end

    def service_url
      raise NotImplementedError
    end

    private
    
    def connection
      @connection ||= Faraday.new(service_url) do |config|
        config.request :json
        config.response :raise_error
        config.response :json, content_type: /\bjson$/
        config.use :instrumentation
        config.options[:timeout] = 10
        config.use Faraday::RequestId
        config.adapter Faraday.default_adapter
      end
    end

    def process_response(response)
      if response.success?
        body = response.body
        if body.empty?
          {}
        elsif body.is_a?(Array)
          body.map(&:deep_symbolize_keys)
        else
          body.deep_symbolize_keys
        end
      end
    end
  end

end