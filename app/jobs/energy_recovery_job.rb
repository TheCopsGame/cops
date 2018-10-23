class EnergyRecoveryJob < ApplicationJob
  queue_as :default

  def perform
    Character.find_each do |character|
      next unless character.energy < 100

      character.increment(:energy)
      character.save
    end

    EnergyRecoveryJob.set(wait: 15.seconds).perform_later
  end
end
