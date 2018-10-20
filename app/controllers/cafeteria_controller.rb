class CafeteriaController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def purchase_snack
    Cops::PurchaseManager.call(
      character: current_character,
      item: SnackKind.coerce(params[:snack_kind])
    )

    redirect_with_message(path: cafeteria_path, kind: :notice, message: t('.success'))
  rescue Cops::PurchaseManager::InvalidParamsError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: t('.invalid_params'))
  rescue Cops::PurchaseManager::InsufficientFundsError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: t('.insufficient_funds'))
  rescue Cops::PurchaseManager::CharacterValidationError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: t('.invalid_character'))
  end
end
