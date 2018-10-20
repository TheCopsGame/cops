module Cops
  class PurchaseManager
    class InsufficientFundsError < StandardError; end

    def call
      raise InsufficientFundsError unless character_has_required_attributes?

      super
    end
  end
end
