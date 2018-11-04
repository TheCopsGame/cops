# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Library', type: :request do
  let(:user) { create_and_login_user }
  let!(:character) { create(:character, energy: 100, money: 100, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get library_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #read' do
    subject { post read_path, params: params }

    context 'with valid params' do
      let(:params) do
        { book: BookKind::COP.name }
      end

      it 'increases the character intelligence' do
        expect { subject }.to change(character, :intelligence).by(BookKind::COP.intelligence)
      end

      it 'decreases the character money' do
        expect { subject }.to change(character, :money).by(BookKind::COP.money)
      end

      it 'decreases the character energy' do
        expect { subject }.to change(character, :energy).by(BookKind::COP.energy)
      end

      it 'redirects to the library page' do
        subject
        expect(response).to redirect_to(library_path)
      end
    end

    context 'with invalid params' do
      let(:params) do
        { book: BookKind::COP.name }
      end

      it 'redirects to the library page' do
        expect(Cops::PurchaseManager).to receive(:call).and_raise(Cops::PurchaseManager::InvalidParamsError)
        subject
        expect(response).to redirect_to(library_path)
      end
    end

    context 'without sufficient money and energy to read a book' do
      let!(:character) { create(:character, money: 0, energy: 0, user: user) }

      let(:params) do
        { book: BookKind::COP.name }
      end

      it 'does not increase the intelligence' do
        expect do
          subject
        end.not_to change(character, :intelligence)
      end

      it 'redirects to the library page' do
        subject
        expect(response).to redirect_to(library_path)
      end
    end

    context 'with invalid character attributes' do
      let(:params) do
        { book: BookKind::COP.name }
      end

      it 'redirects to the library page' do
        allow(Cops::PurchaseManager).to receive(:call).and_raise(Cops::PurchaseManager::CharacterValidationError)
        subject
        expect(response).to redirect_to(library_path)
      end
    end
  end
end
