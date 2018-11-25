class JobsController < ApplicationController
  before_action :authenticate_user!

  rescue_from Cops::JobManager::InvalidParamsError, with: :invalid_params_handler
  rescue_from Cops::JobManager::InsufficientLevelError, with: :insufficient_level_handler
  rescue_from Cops::JobManager::InsufficientEnergyError, with: :insufficient_energy_handler
  rescue_from Cops::JobManager::CharacterValidationError, with: :character_validation_handler

  def index; end

  def work
    Cops::JobManager.call(
      character: current_character,
      item: JobKind.coerce(params[:job_kind])
    )

    redirect_with_message(path: jobs_path, kind: :notice, message: t('.success'))
  end

  private

  def invalid_params_handler
    redirect_with_message(path: jobs_path, kind: :alert, message: t('.invalid_params'))
  end

  def insufficient_level_handler
    redirect_with_message(path: jobs_path, kind: :alert, message: t('.insufficient_level'))
  end

  def insufficient_energy_handler
    redirect_with_message(path: jobs_path, kind: :alert, message: t('.insufficient_energy'))
  end

  def character_validation_handler
    redirect_with_message(path: jobs_path, kind: :alert, message: t('.invalid_character'))
  end
end
