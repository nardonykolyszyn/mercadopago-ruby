# frozen_string_literal: true

require 'faraday/request_id'

class HttpClient
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
      if body.blank?
        {}
      elsif
        body.map(&:deep_symbolize_keys)
      else
        body.deep_symbolize_keys
      end
    end
  end
end
