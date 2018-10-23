# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cafeteria', type: :request do
  let(:user) { create_and_login_user }
  let!(:character) { create(:character, energy: 0, money: 100, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get cafeteria_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #purchase_snack' do
    subject { post purchase_snack_path, params: params }

    context 'with valid params' do
      let(:params) do
        { snack_kind: SnackKind::SODA.name }
      end

      it 'increases the character energy' do
        expect { subject }.to change(character, :energy).by(SnackKind::SODA.energy)
      end

      it 'decreases the character money' do
        expect { subject }.to change(character, :money).by(SnackKind::SODA.money)
      end

      it 'redirects to the cafeteria page' do
        subject
        expect(response).to redirect_to(cafeteria_path)
      end
    end

    context 'with invalid params' do
      let(:params) do
        { snack_kind: SnackKind::PIZZA.name }
      end

      it 'redirects to the cafeteria page' do
        expect(Cops::PurchaseManager).to receive(:call).and_raise(Cops::PurchaseManager::InvalidParamsError)
        subject
      end
    end

    context 'without sufficient money to purchase item' do
      let!(:character) { create(:character, money: 0, user: user) }

      let(:params) do
        { snack_kind: SnackKind::PIZZA.name }
      end

      it 'does not increase the energy' do
        expect do
          subject
        end.not_to change(character, :energy)
      end

      it 'redirects to the cafeteria page' do
        subject
        expect(response).to redirect_to(cafeteria_path)
      end
    end

    context 'with invalid character attributes' do
      let(:params) do
        { snack_kind: SnackKind::COOKIE.name }
      end

      it 'redirects to the cafeteria page' do
        expect(Cops::PurchaseManager).to receive(:call).and_raise(Cops::PurchaseManager::CharacterValidationError)
        subject
      end
    end
  end
end
