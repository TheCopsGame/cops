require 'rails_helper'

RSpec.describe EnergyRecoveryWorker, type: :worker do
  describe '#perform' do
    subject { described_class.new.perform }

    context 'when character energy is below 100' do
      let!(:character) { create(:character, energy: 99) }

      it 'increases its energy by 1' do
        expect do
          subject
          character.reload
        end.to change(character, :energy).by(1)
      end

      it 'schedules the worker to perform again in 15 seconds' do
        expect do
          subject
        end.to change(EnergyRecoveryWorker.jobs, :size).by(1)
      end
    end

    context 'when character energy is 100' do
      let!(:character) { create(:character, energy: 100) }

      it 'does not increase its energy' do
        expect do
          subject
          character.reload
        end.not_to change(character, :energy)
      end

      it 'schedules the worker to perform again in 15 seconds' do
        expect do
          subject
        end.to change(EnergyRecoveryWorker.jobs, :size).by(1)
      end
    end
  end
end
