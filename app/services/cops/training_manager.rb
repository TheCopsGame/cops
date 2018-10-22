module Cops
  class TrainingManager < BaseManager
    class InsufficientEnergyError < StandardError; end

    def call
      raise InsufficientEnergyError unless character_has_required_attributes?
      super
    end
  end
end
