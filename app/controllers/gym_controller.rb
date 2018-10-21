class GymController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def train
    Cops::TrainingManager.call(
      character: current_character,
      item: TrainingKind.coerce(params[:training_kind])
    )

    redirect_with_message(path: gym_path, kind: :notice, message: t('.success'))
  rescue Cops::TrainingManager::InvalidParamsError
    redirect_with_message(path: gym_path, kind: :alert, message: t('.invalid_params'))
  rescue Cops::TrainingManager::InsufficientEnergyError
    redirect_with_message(path: gym_path, kind: :alert, message: t('.insufficient_energy'))
  rescue Cops::TrainingManager::CharacterValidationError
    redirect_with_message(path: gym_path, kind: :alert, message: t('.invalid_character'))
  end
end
