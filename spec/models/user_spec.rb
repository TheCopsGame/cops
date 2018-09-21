require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to have_one(:character).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
  end
end
