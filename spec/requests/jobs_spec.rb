# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  let(:user) { create_and_login_user }
  let!(:character) { create(:character, level: 1, energy: 100, user: user) }

  describe 'GET #index' do
    it 'returns http success' do
      get jobs_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #work' do
    context 'with valid params' do
      let(:params) do
        {
          job_kind: :warehouse
        }
      end

      it 'increases the character experience and money' do
        expect do
          post work_path, params: params
        end.to change(character, :experience).by(5).and change(character, :money).by(10)
      end

      it 'redirects to the jobs page' do
        post work_path, params: params

        expect(response).to redirect_to(jobs_path)
      end
    end

    context 'with invalid params' do
      let(:params) do
        {
          job_kind: :warehouse
        }
      end

      it 'redirects to the jobs page' do
        expect(Cops::JobManager).to receive(:call).and_raise(Cops::JobManager::InvalidParamsError)

        post work_path, params: params
      end
    end

    context 'without sufficient energy to work' do
      let!(:character) { create(:character, energy: 0, user: user) }
      let(:params) do
        {
          job_kind: :warehouse
        }
      end

      it 'does not increase the character experience' do
        expect do
          post work_path, params: params
        end.not_to change(character, :experience)
      end

      it 'does not increase the character money' do
        expect do
          post work_path, params: params
        end.not_to change(character, :money)
      end

      it 'redirects to the jobs page' do
        post work_path, params: params

        expect(response).to redirect_to(jobs_path)
      end
    end

    context 'with invalid character attributes' do
      let(:params) do
        {
          job_kind: :warehouse
        }
      end

      it 'redirects to the gym page' do
        expect(Cops::JobManager).to receive(:call).and_raise(Cops::JobManager::CharacterValidationError)

        post work_path, params: params
      end
    end

    context 'without the required level to work' do
      let(:params) do
        {
          job_kind: :patrol
        }
      end

      it 'does not increase the character experience' do
        expect do
          post work_path, params: params
        end.not_to change(character, :experience)
      end

      it 'does not increase the character money' do
        expect do
          post work_path, params: params
        end.not_to change(character, :money)
      end

      it 'redirects to the jobs page' do
        post work_path, params: params

        expect(response).to redirect_to(jobs_path)
      end
    end
  end
end
