# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Missions', type: :request do
  let(:user) { create_and_login_user }
  let!(:character) { create(:character, level: 1, energy: 100, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get missions_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #perform' do
    context 'with valid params' do
      let(:params) do
        {
          mission_kind: :help_old_woman
        }
      end

      it 'increases the character experience, money, strength, agility and intelligence' do
        expect do
          post perform_path, params: params
        end.to change(character, :experience).by(30).and(change(character, :money).by(30))
          .and(change(character, :strength).by(10)).and(change(character, :agility).by(10))
          .and(change(character, :intelligence).by(10)).and(change(character, :energy).by(-50))
      end

      it 'redirects to the missions page' do
        post perform_path, params: params

        expect(response).to redirect_to(missions_path)
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          mission_kind: :help_old_woman
        }
      end

      it 'redirects to the missions page' do
        expect(Cops::MissionManager).to receive(:call).and_raise(Cops::MissionManager::InvalidParamsError)

        post perform_path, params: params
      end
    end

    context 'without sufficient energy to perform the mission' do
      let!(:character) { create(:character, energy: 0, user: user) }
      let(:params) do
        {
          mission_kind: :help_old_woman
        }
      end

      it 'does not increase the character experience' do
        expect do
          post perform_path, params: params
        end.not_to change(character, :experience)
      end

      it 'does not increase the character money' do
        expect do
          post perform_path, params: params
        end.not_to change(character, :money)
      end

      it 'redirects to the missions page' do
        post perform_path, params: params

        expect(response).to redirect_to(missions_path)
      end
    end

    context 'with invalid character attributes' do
      let(:params) do
        {
          mission_kind: :help_old_woman
        }
      end

      it 'redirects to the gym page' do
        expect(Cops::MissionManager).to receive(:call).and_raise(Cops::MissionManager::CharacterValidationError)

        post perform_path, params: params
      end
    end

    context 'without the required level to perform the mission' do
      let(:params) do
        {
          mission_kind: :stop_robbery
        }
      end

      it 'does not increase the character experience' do
        expect do
          post perform_path, params: params
        end.not_to change(character, :experience)
      end

      it 'does not increase the character money' do
        expect do
          post perform_path, params: params
        end.not_to change(character, :money)
      end

      it 'redirects to the missions page' do
        post perform_path, params: params

        expect(response).to redirect_to(missions_path)
      end
    end
  end
end
