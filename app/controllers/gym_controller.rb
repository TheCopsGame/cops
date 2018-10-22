class GymController < ApplicationController
  before_action :authenticate_user!

  rescue_from Cops::TrainingManager::InvalidParamsError, with: :invalid_params_handler
  rescue_from Cops::TrainingManager::InsufficientEnergyError, with: :insufficient_energy_handler
  rescue_from Cops::TrainingManager::CharacterValidationError, with: :character_validation_handler

  def index; end

  def train
    Cops::TrainingManager.call(
      character: current_character,
      item: TrainingKind.coerce(params[:training_kind])
    )

    redirect_with_message(path: gym_path, kind: :notice, message: t('.success'))
  end

  private

  def invalid_params_handler
    redirect_with_message(path: gym_path, kind: :alert, message: t('.invalid_params'))
  end

  def insufficient_energy_handler
    redirect_with_message(path: gym_path, kind: :alert, message: t('.insufficient_energy'))
  end

  def character_validation_handler
    redirect_with_message(path: gym_path, kind: :alert, message: t('.invalid_character'))
  end
end
