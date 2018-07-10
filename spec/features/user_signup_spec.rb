# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User signup', type: :feature do
  let(:params) { build(:user) }

  before do
    visit new_user_registration_path
  end

  context 'with valid params' do
    it 'creates a new user' do
      fill_in 'user_username', with: params.username
      fill_in 'user_email', with: params.email
      fill_in 'user_password', with: params.password
      fill_in 'user_password_confirmation', with: params.password

      expect do
        click_button(I18n.t('devise.registrations.new.sign_up'))
      end.to change(User, :count).by(1)
    end
  end

  context 'with invalid params' do
    it 'does not create a new user' do
      fill_in 'user_username', with: params.username
      fill_in 'user_email', with: params.email
      fill_in 'user_password', with: '1234'
      fill_in 'user_password_confirmation', with: '123456'

      expect do
        click_button(I18n.t('devise.registrations.new.sign_up'))
      end.not_to change(User, :count)
    end

    it 'displays error message' do
      fill_in 'user_username', with: params.username
      fill_in 'user_email', with: params.email
      fill_in 'user_password', with: '1234'
      fill_in 'user_password_confirmation', with: '123456'

      click_button(I18n.t('devise.registrations.new.sign_up'))

      expect(page).to have_content(I18n.t('errors.messages.confirmation', attribute: 'Password'))
      expect(page).to have_content(I18n.t('errors.messages.too_short', count: 6))
    end
  end
end
