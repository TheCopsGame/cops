# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Characters', type: :request do
  describe 'GET #index' do
    before do
      create_and_login_user
    end

    it 'returns http success' do
      get characters_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    let!(:user) { create_and_login_user }

    context 'when the user does not have a character' do
      it 'returns http success' do
        get new_character_path

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user already has a character' do
      it 'redirects to the characters list' do
        create(:character, user: user)

        get new_character_path

        expect(response).to redirect_to(characters_path)
      end
    end
  end

  describe 'GET #show' do
    let!(:user) { create_and_login_user }

    it 'returns http success' do
      character = create(:character, user: user)

      get character_path(character)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    before do
      create_and_login_user
    end

    context 'with valid params' do
      it 'creates a new character' do
        expect do
          post characters_path, params: { character: attributes_for(:character) }
        end.to change(Character, :count).by(1)
      end

      it 'redirects to the created character' do
        post characters_path, params: { character: attributes_for(:character) }

        expect(response).to redirect_to(character_path(Character.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new character' do
        expect do
          post characters_path, params: { character: { name: nil } }
        end.not_to change(Character, :count)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    let!(:user) { create_and_login_user }

    context 'with valid params' do
      it 'updates the character' do
        character = create(:character, user: user)
        new_attributes = attributes_for(:character)

        put character_path(character), params: { character: new_attributes }
        character.reload

        expect(character.name).to eq(new_attributes[:name])
      end

      it 'redirects to the updated character' do
        character = create(:character, user: user)
        new_attributes = attributes_for(:character)

        put character_path(character), params: { character: new_attributes }

        expect(response).to redirect_to(character_path(character))
      end
    end

    context 'with invalid params' do
      it 'does not update the character' do
        character = create(:character, user: user)
        old_character_name = character.name
        new_attributes = { name: nil }

        put character_path(character), params: { character: new_attributes }
        character.reload

        expect(character.name).to eq(old_character_name)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create_and_login_user }

    it 'deletes the character from current user' do
      character = create(:character, user: user)

      expect do
        delete character_path(character)
      end.to change(Character, :count).by(-1)
    end
  end
end
