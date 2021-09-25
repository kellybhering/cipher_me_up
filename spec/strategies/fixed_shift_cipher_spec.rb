# frozen_string_literal: true

require 'spec_helper'

describe FixedShiftCipher do
  describe '.cipher' do
    context 'with an informed shift factor' do
    end

    context 'with default shift factor' do
      subject { FixedShiftCipher.cipher(word) }

      context 'and a word with letters and numbers' do
        let(:word) { 'HelloWorld123' }

        it 'should return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog456')
        end
      end

      context 'and a letter in which the ciphering would exceed z' do
        let(:word) { 'HxlloWorld123' }

        it 'should restart the alphabet and return the ciphered word correctly' do
          is_expected.to eq('KaoorZruog456')
        end
      end

      context 'and a number in which the ciphering would exceed 9' do
        let(:word) { 'HelloWorld128' }

        it 'should return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog451')
        end
      end

      context 'and a word with any other character than letters and numbers' do
        let(:word) { 'HelloWorld129!' }

        it 'should ignore unpermitted characters and return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog452!')
        end
      end
    end
  end

  describe 'uncipher' do
    context 'with default shift factor' do
      subject { FixedShiftCipher.uncipher(word) }

      context 'and a word with letters and numbers' do
        let(:word) { 'KhoorZruog456' }

        it 'should return the unciphered word correctly' do
          is_expected.to eq('HelloWorld123')
        end
      end

      context 'and a letter in which the ciphering would precede a' do
        let(:word) { 'KboorZruog456' }

        it 'should return the unciphered word correctly' do
          is_expected.to eq('HylloWorld123')
        end
      end

      context 'and a number in which the ciphering would precede 0' do
        let(:word) { 'KhoorZruog451' }

        it 'should return the unciphered word correctly' do
          is_expected.to eq('HelloWorld128')
        end
      end

      context 'and a word with any other character than letters and numbers' do
        let(:word) { 'KhoorZruog450!' }

        it 'should ignore unpermitted characters and return the unciphered word correctly' do
          is_expected.to eq('HelloWorld127!')
        end
      end
    end
  end
end
