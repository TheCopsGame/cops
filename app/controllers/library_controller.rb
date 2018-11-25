class LibraryController < ApplicationController
  before_action :authenticate_user!

  rescue_from Cops::PurchaseManager::InvalidParamsError, with: :invalid_params_handler
  rescue_from Cops::PurchaseManager::InsufficientFundsError, with: :insufficient_funds_handler
  rescue_from Cops::PurchaseManager::CharacterValidationError, with: :character_validation_handler

  def index; end

  def read
    Cops::PurchaseManager.call(
      character: current_character,
      item: BookKind.coerce(params[:book])
    )

    redirect_with_message(path: library_path, kind: :notice, message: t('.success'))
  end

  private

  def invalid_params_handler
    redirect_with_message(path: library_path, kind: :alert, message: t('.invalid_params'))
  end

  def insufficient_funds_handler
    redirect_with_message(path: library_path, kind: :alert, message: t('.insufficient_funds'))
  end

  def character_validation_handler
    redirect_with_message(path: library_path, kind: :alert, message: t('.invalid_character'))
  end
end
