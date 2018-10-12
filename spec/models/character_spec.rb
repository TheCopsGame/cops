require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    it { is_expected.to validate_numericality_of(:experience).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:money).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:level).only_integer }
    it { is_expected.to validate_numericality_of(:level).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:energy).only_integer }
    it { is_expected.to validate_numericality_of(:energy).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:energy).is_less_than_or_equal_to(100) }
    it { is_expected.to validate_numericality_of(:strength).only_integer }
    it { is_expected.to validate_numericality_of(:strength).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:agility).only_integer }
    it { is_expected.to validate_numericality_of(:agility).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:intelligence).only_integer }
    it { is_expected.to validate_numericality_of(:intelligence).is_greater_than_or_equal_to(1) }
  end
end
