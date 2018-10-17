# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Gym', type: :request do
  let(:user) { create_and_login_user }
  let!(:character) { create(:character, energy: 100, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get gym_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #train' do
    context 'with valid params' do
      context 'and training the weightlifting' do
        let(:params) do
          {
            training_kind: :weightlifting
          }
        end

        it 'increases the character strength' do
          expect do
            post train_path, params: params
          end.to change(character, :strength).by(5)
        end

        it 'redirects to the gym page' do
          post train_path, params: params

          expect(response).to redirect_to(gym_path)
        end
      end

      context 'and training the run' do
        let(:params) do
          {
            training_kind: :running
          }
        end

        it 'increases the character strength' do
          expect do
            post train_path, params: params
          end.to change(character, :agility).by(5)
        end

        it 'redirects to the gym page' do
          post train_path, params: params

          expect(response).to redirect_to(gym_path)
        end
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          training_kind: :weightlifting
        }
      end

      it 'redirects to the gym page' do
        expect(Cops::TrainingManager).to receive(:call).and_raise(Cops::TrainingManager::InvalidParamsError)

        post train_path, params: params
      end
    end

    context 'without sufficient energy to train' do
      let!(:character) { create(:character, energy: 0, user: user) }

      context 'and training the weightlifting' do
        let(:params) do
          {
            training_kind: :weightlifting
          }
        end

        it 'does not increase the character strength' do
          expect do
            post train_path, params: params
          end.not_to change(character, :strength)
        end

        it 'redirects to the gym page' do
          post train_path, params: params

          expect(response).to redirect_to(gym_path)
        end
      end

      context 'and training the run' do
        let(:params) do
          {
            training_kind: :running
          }
        end

        it 'does not increase the agility' do
          expect do
            post train_path, params: params
          end.not_to change(character, :agility)
        end

        it 'redirects to the gym page' do
          post train_path, params: params

          expect(response).to redirect_to(gym_path)
        end
      end
    end

    context 'with invalid character attributes' do
      let(:params) do
        {
          training_kind: :weightlifting
        }
      end

      it 'redirects to the gym page' do
        expect(Cops::TrainingManager).to receive(:call).and_raise(Cops::TrainingManager::CharacterValidationError)

        post train_path, params: params
      end
    end
  end
end
