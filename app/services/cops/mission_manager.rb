module Cops
  class MissionManager < BaseManager
    class InsufficientLevelError < StandardError; end
    class InsufficientEnergyError < StandardError; end

    def call
      raise InsufficientLevelError unless character_has_required_level?
      raise InsufficientEnergyError unless character_has_required_attributes?
      super
    end

    private

    def character_has_required_level?
      character.level >= item.level
    end
  end
end
