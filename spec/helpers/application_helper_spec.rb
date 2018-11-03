require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_message_class' do
    context 'when the flash is a notice' do
      it 'returns the positive string' do
        expect(helper.flash_message_class('notice')).to eq('positive')
      end
    end

    context 'when the flash is an alert' do
      it 'returns the negative string' do
        expect(helper.flash_message_class('alert')).to eq('negative')
      end
    end

    context 'when the flash is neither a notice nor an alert' do
      it 'returns empty string' do
        expect(helper.flash_message_class('something_else')).to eq('')
      end
    end
  end
end
