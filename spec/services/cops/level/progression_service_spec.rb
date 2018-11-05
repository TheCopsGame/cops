require 'rails_helper'

RSpec.describe Cops::Level::ProgressionService do
  subject { described_class.call(character) }

  context 'valid arguments' do
    context 'when character has to progress level' do
      let(:character) do
        create(
          :character,
          level: 1,
          experience: CharacterLevel::LEVEL_2.experience,
          strength: CharacterLevel::LEVEL_2.strength,
          agility: CharacterLevel::LEVEL_2.agility,
          intelligence: CharacterLevel::LEVEL_2.intelligence
        )
      end

      it { expect { subject }.to change(character, :level).by(1) }
    end

    context 'when character does not have to progress level' do
      let(:character) do
        create(
          :character,
          level: 1,
          experience: 10,
          strength: 10,
          agility: 10,
          intelligence: 10
        )
      end

      it { expect { subject }.not_to change(character, :level) }
    end

    context 'when character is already on the last level' do
      let(:character) do
        create(
          :character,
          level: 5,
          experience: CharacterLevel::LEVEL_5.experience,
          strength: CharacterLevel::LEVEL_5.strength,
          agility: CharacterLevel::LEVEL_5.agility,
          intelligence: CharacterLevel::LEVEL_5.intelligence
        )
      end

      it { expect { subject }.not_to change(character, :level) }
    end
  end

  context 'invalid arguments' do
    let(:character) { nil }
    it { is_expected.to be_nil }
  end
end
