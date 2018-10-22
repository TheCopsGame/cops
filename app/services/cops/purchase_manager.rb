module Cops
  class PurchaseManager < BaseManager
    class InsufficientFundsError < StandardError; end

    def call
      raise InsufficientFundsError unless character_has_required_attributes?
      super
    end
  end
end
