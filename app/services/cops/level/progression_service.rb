module Cops
  module Level
    class ProgressionService
      private_class_method :new

      def self.call(character)
        new(character).call
      end

      def initialize(character)
        @character = character
      end

      def call
        return unless character
        character.increment(:level) if should_progress_level?
        character.save
      end

      private

      attr_accessor :character

      def next_level
        character.level + 1
      end

      def should_progress_level?
        CharacterLevel.level_properties.map do |property|
          character.send(property) >=
            CharacterLevel.coerce("level_#{next_level}").send(property) rescue false
        end.all?(true)
      end
    end
  end
end
