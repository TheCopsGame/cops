class EnergyRecoveryWorker
  include Sidekiq::Worker

  def perform
    Character.find_each do |character|
      character.increment!(:energy, 1) if character.energy < 100
    end

    EnergyRecoveryWorker.perform_in(15.seconds)
  end
end
