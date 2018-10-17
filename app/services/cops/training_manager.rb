module Cops
  class TrainingManager
    class InvalidParamsError < StandardError; end
    class InsufficientEnergyError < StandardError; end
    class CharacterValidationError < StandardError; end

    ##
    # Params explanation:
    #
    # character: character instance
    # item: enum instance item
    # cost_attrs: hash element where key = enum, value = character attribute to compare with
    # gain_attrs: hash element where key = enum, value = character attribute to increment

    private_class_method :new

    attr_reader :item, :cost_attrs, :gain_attrs
    attr_accessor :character

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
      raise InsufficientEnergyError unless character_has_sufficient_energy?

      update_character_attributes!
    end

    private

    def valid_params?
      [:character, :item, :cost_attrs, :gain_attrs].map do |param|
        send(param).present?
      end.all?(true)
    end

    def character_has_sufficient_energy?
      cost_attrs.map do |enum_option, char_attribute|
        character.send(char_attribute) >= item.send(enum_option)
      end.all?(true)
    end

    def update_character_attributes!
      gain_attrs.each do |enum_option, char_attribute|
        character.increment(char_attribute, item.send(enum_option))
      end

      cost_attrs.each do |enum_option, char_attribute|
        character.decrement(char_attribute, item.send(enum_option))
      end

      raise CharacterValidationError unless character.valid?
      character.save
    end
  end
end
