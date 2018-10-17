module Cops
  class BaseManager
    class InvalidParamsError < StandardError; end
    class CharacterValidationError < StandardError; end

    # Params:
    # character: character instance
    # item: enum instance item
    # cost_attrs: hash element where key = enum, value = character attribute to compare with
    # gain_attrs: hash element where key = enum, value = character attribute to increment

    attr_reader :character, :item, :cost_attrs, :gain_attrs

    def self.call(character:, item:, cost_attrs: {}, gain_attrs: {})
      new(character, item, cost_attrs, gain_attrs).call
    end

    def initialize(character, item, cost_attrs, gain_attrs)
      @character = character
      @item = item
      @cost_attrs = cost_attrs
      @gain_attrs = gain_attrs
    end

    def call
      raise InvalidParamsError unless valid_params?

      update_character_attributes!
    end

    private

    def character_has_required_attributes?
      cost_attrs.map do |enum_option, char_attribute|
        character.send(char_attribute) >= item.send(enum_option)
      end.all?(true)
    end

    def valid_params?
      [:character, :item, :cost_attrs, :gain_attrs].map do |param|
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
      gain_attrs.each do |enum_option, char_attribute|
        character.increment(char_attribute, item.send(enum_option))
      end
    end

    def deduct_costs
      cost_attrs.each do |enum_option, char_attribute|
        character.decrement(char_attribute, item.send(enum_option))
      end
    end
  end
end
