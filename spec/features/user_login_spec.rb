# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  context 'with valid data' do
    before do
      user.confirm
    end

    it 'logs the user in' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      click_button(I18n.t('devise.sessions.new.login'))

      expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
    end
  end

  context 'with the wrong data' do
    before do
      user.confirm
    end

    it 'does not log the user in' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '1'

      expect do
        click_button(I18n.t('devise.sessions.new.login'))
      end.not_to change(user, :sign_in_count)
    end

    it 'displays error message' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'wrong'

      click_button(I18n.t('devise.sessions.new.login'))

      expect(page).to have_content(I18n.t('devise.failure.invalid', authentication_keys: 'Email'))
    end
  end

  context 'when user has not confirmed his/her email' do
    it 'does not log the user in' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      click_button(I18n.t('devise.sessions.new.login'))

      expect do
        click_button(I18n.t('devise.sessions.new.login'))
      end.not_to change(user, :sign_in_count)
    end

    it 'displays error message' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password

      click_button(I18n.t('devise.sessions.new.login'))

      expect(page).to have_content(I18n.t('devise.failure.unconfirmed'))
    end
  end
end
