# frozen_string_literal: true

describe StringHelper do
  describe '.is_integer?' do
    it 'should return true for an integer' do
      expect(StringHelper.is_integer?('1')).to be true
    end

    it 'should return false for a non integer' do
      expect(StringHelper.is_integer?('a')).to be false
    end
  end

  describe '.is_uppercase?' do
    it 'should return true for an uppercase letter' do
      expect(StringHelper.is_uppercase?('A')).to be true
    end

    it 'should return false for a non uppercase letter' do
      expect(StringHelper.is_uppercase?('a')).to be false
    end
  end

  describe 'are_letters_only?' do
    it 'should return true when there are only letters in a word' do
      expect(StringHelper.are_letters_only?('Test')).to be true
    end

    it 'should return false when there are numbers in a word' do
      expect(StringHelper.are_letters_only?('Test123')).to be false
    end

    it 'should return false when there are special characters in a word' do
      expect(StringHelper.are_letters_only?('Test!')).to be false
    end

    it 'should return false when there are white spaces in a word' do
      expect(StringHelper.are_letters_only?('Test ')).to be false
    end

    it 'should return false when to empty word' do
      expect(StringHelper.are_letters_only?('')).to be false
    end
  end
end
