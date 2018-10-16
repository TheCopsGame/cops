class CafeteriaController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def purchase_snack
    Cops::PurchaseManager.call(
      character: current_character,
      item: SnackKind.coerce(params[:snack_kind]),
      cost_attrs: { cost: :money },
      gain_attrs: { energy: :energy }
    )

    redirect_with_message(path: cafeteria_path, kind: :notice, message: :success)
  rescue Cops::PurchaseManager::InvalidParamsError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: :insufficient_params)
  rescue Cops::PurchaseManager::InsufficientFundsError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: :insufficient_funds)
  rescue Cops::PurchaseManager::CharacterValidationError
    redirect_with_message(path: cafeteria_path, kind: :alert, message: :invalid_character)
  end
end
