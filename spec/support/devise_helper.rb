# frozen_string_literal: true

module DeviseHelper
  def create_and_login_user
    user = create(:user)
    user.confirm

    login_as(user)

    user
  end
end
