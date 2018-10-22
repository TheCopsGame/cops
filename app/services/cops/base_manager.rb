module Cops
  class BaseManager
    class InvalidParamsError < StandardError; end
    class CharacterValidationError < StandardError; end

    # Params:
    # character: character instance
    # item: enum instance item

    attr_reader :character, :item

    def self.call(character:, item:)
      new(character, item).call
    end

    def initialize(character, item)
      @character = character
      @item = item
    end

    def call
      raise InvalidParamsError unless valid_params?
      update_character_attributes!
    end

    private

    def character_has_required_attributes?
      item.cost_properties.map do |property|
        character.send(property) >= item.send(property).abs
      end.all?(true)
    end

    def valid_params?
      [:character, :item].map do |param|
        send(param).present?
      end.all?(true)
    end

    def update_character_attributes!
      increase_gains
      deduct_costs

      raise CharacterValidationError unless character.valid?
      character.save
    end

    def increase_gains
      item.gain_properties.each do |property|
        character.increment(property, item.send(property).abs)
      end
    end

    def deduct_costs
      item.cost_properties.each do |property|
        character.decrement(property, item.send(property).abs)
      end
    end
  end
end
