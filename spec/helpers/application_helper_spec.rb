require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context '#minutes_in_words' do
    it 'returns a human readable string describing the given minues' do
      expect(minutes_in_words(120)).to eq 'about 2 hours'
    end

    it 'does not calculate seconds' do
      expect(minutes_in_words(0.1)).to eq 'less than a minute'
    end

    it 'throws an error when not given a number' do
      expect{minutes_in_words('words')}.to raise_error(NoMethodError)
    end
  end
end
