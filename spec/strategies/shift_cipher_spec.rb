# frozen_string_literal: true

require 'spec_helper'

describe ShiftCipher do
  describe '.cipher' do
    context 'with default shift factor' do
      subject(:ciphering) { ShiftCipher.cipher(word) }

      context 'and a word with letters and numbers' do
        let(:word) { 'HelloWorld123' }
  
        it 'should return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog456')
        end
      end
  
      context 'and a word with z' do
        let(:word) { 'HzlloWorld123' }
  
        it 'should return the ciphered word correctly' do
          is_expected.to eq('KcoorZruog456')
        end
      end

      context 'and a word with Z' do
        let(:word) { 'HZlloWorld123' }
  
        it 'should return the ciphered word correctly' do
          is_expected.to eq('KCoorZruog456')
        end
      end

      context 'and a word with 9' do
        let(:word) { 'HelloWorld129' }
  
        it 'should return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog452')
        end
      end

      context 'and a word with any other character than letters and numbers' do
        let(:word) { 'HelloWorld129!' }
  
        it 'should return the ciphered word correctly' do
          is_expected.to eq('KhoorZruog452')
        end
      end
    end
   
  end
end