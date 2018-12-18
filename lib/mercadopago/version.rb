# frozen_string_literal: true

module MercadoPago
  class Version
    MAJOR = 0
    MINOR = 10
    PATCH = 7

    class << self
      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end
    end
  end
end
