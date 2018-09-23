require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    subject! { get :home }

    it 'returns http success' do
      is_expected.to be_successful
    end

    it 'renders the correct layout' do
      is_expected.to render_template(:auth)
    end
  end

  describe 'GET #dashboard' do
    before do
      login_as(create(:user))
    end

    subject! { get :dashboard }

    it 'returns http success' do
      is_expected.to be_successful
    end

    it 'renders the correct layout' do
      is_expected.to render_template(:dashboard)
    end
  end
end
