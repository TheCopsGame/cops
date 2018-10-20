class EnergyRecoveryJob < ApplicationJob
  queue_as :default

  def perform
    Character.find_each do |character|
      character.increment!(:energy, 1) if character.energy < 100
    end

    EnergyRecoveryJob.set(wait: 15.seconds).perform_later
  end
end
