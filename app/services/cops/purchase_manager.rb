module Cops
  class PurchaseManager
    class InvalidParamsError < StandardError; end
    class InsufficientFundsError < StandardError; end
    class CharacterValidationError < StandardError; end

    ##
    # Params explanation:
    #
    # character: character instance
    # item: enum instance item
    # cost_attrs: hash element where key = enum, value = character attribute to compare with
    # gain_attrs: hash element where key = enum, value = character attribute to increment

    # TODO: create specs

    private_class_method :new

    def self.call(character:, item:, cost_attrs: {}, gain_attrs: {})
      new(character, item, cost_attrs, gain_attrs).call
    end

    def initialize(character, item, cost_attrs, gain_attrs)
      @character = character
      @item = item
      @cost_attrs = cost_attrs
      @gain_attrs = gain_attrs
    end

    private

    attr_reader :item, :cost_attrs, :gain_attrs
    attr_accessor :character

    def call
      raise InvalidParamsError unless valid_params?
      raise InsufficientFundsError unless character_has_sufficient_funds?

      update_character_attributes!
    end

    def valid_params?
      %i(character item cost_attrs gain_attrs).map do |param|
        send(param).present?
      end.all?(true)
    end

    def character_has_sufficient_funds?
      cost_attrs.map do |enum_option, char_attribute|
        character.send(char_attribute) >= item.send(enum_option)
      end.all?(true)
    end

    def update_character_attributes!
      gain_attrs.each do |enum_option, char_attribute|
        character.increment(char_attribute, by: item.send(enum_option))
      end

      raise CharacterValidationError unless character.valid?
      character.save
    end
  end
end
