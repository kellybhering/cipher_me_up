# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CipherMeUp::MainCommand do
  describe 'word' do
    subject(:cipher_word) { described_class.start(['word'] + args) }
    let(:word) { 'Cipher' }

    context 'when passing correct arguments' do
      let(:args) { [word, option_1, value_1, option_2, value_2] }

      context 'with shift_factor value for --with option and 3 for --value option' do
        let(:option_1) { '--with' }
        let(:value_1) { 'shift_factor' }
        let(:option_2) { '--value' }
        let(:value_2) { '3' }

        it 'should call FixedShiftCipher.cipher with correct arguments' do
          allow(FixedShiftCipher)
            .to receive(:cipher)
            .with(word, shift_factor: value_2.to_i)
            .and_return('foo')

          cipher_word
          expect(FixedShiftCipher).to have_received(:cipher).with(word, shift_factor: value_2.to_i)
        end

        it 'should print the the word ciphered' do
          expect { cipher_word }.to output("Flskhu\n").to_stdout
        end
      end

      context 'with shift_factor value for -w option and 3 for -v option' do
        let(:option_1) { '-w' }
        let(:value_1) { 'shift_factor' }
        let(:option_2) { '-v' }
        let(:value_2) { '3' }

        it 'should call FixedShiftCipher.cipher with correct arguments' do
          allow(FixedShiftCipher)
            .to receive(:cipher)
            .with(word, shift_factor: value_2.to_i)
            .and_return('foo')

          cipher_word
          expect(FixedShiftCipher).to have_received(:cipher).with(word, shift_factor: value_2.to_i)
        end

        it 'should print the the word ciphered' do
          expect { cipher_word }.to output("Flskhu\n").to_stdout
        end
      end

      context "with keyword value for --with option and 'Test' for --value option" do
        let(:option_1) { '--with' }
        let(:value_1) { 'keyword' }
        let(:option_2) { '--value' }
        let(:value_2) { 'Test' }

        it 'should call ShiftByWordCipher.cipher with correct arguments' do
          allow(ShiftByWordCipher)
            .to receive(:cipher)
            .with(word, keyword: value_2)
            .and_return('foo')

          cipher_word
          expect(ShiftByWordCipher).to have_received(:cipher).with(word, keyword: value_2)
        end

        it 'should print the the word ciphered' do
          expect { cipher_word }.to output("Vmhaxv\n").to_stdout
        end
      end

      context "with keyword value for -w option and 'Test' for -v option" do
        let(:option_1) { '-w' }
        let(:value_1) { 'keyword' }
        let(:option_2) { '-v' }
        let(:value_2) { 'Test' }

        it 'should call ShiftByWordCipher.cipher with correct arguments' do
          allow(ShiftByWordCipher)
            .to receive(:cipher)
            .with(word, keyword: value_2)
            .and_return('foo')

          cipher_word
          expect(ShiftByWordCipher).to have_received(:cipher).with(word, keyword: value_2)
        end

        it 'should print the the word ciphered' do
          expect { cipher_word }.to output("Vmhaxv\n").to_stdout
        end
      end
    end

    context 'when ciphering with shift_factor returns nil' do
      let(:args) { [word, option_1, value_1, option_2, value_2] }

      let(:option_1) { '-w' }
      let(:value_1) { 'keyword' }
      let(:option_2) { '-v' }
      let(:value_2) { '3' }

      before { allow(FixedShiftCipher).to receive(:cipher).and_return(nil) }

      it 'should print the error' do
        expect { cipher_word }.to raise_error('Wrong argument for --value option')
      end
    end

    context 'when ciphering with keyword returns nil' do
      let(:args) { [word, option_1, value_1, option_2, value_2] }

      let(:option_1) { '-w' }
      let(:value_1) { 'keyword' }
      let(:option_2) { '-v' }
      let(:value_2) { '3' }

      before { allow(ShiftByWordCipher).to receive(:cipher).and_return(nil) }

      it 'should print the error' do
        expect { cipher_word }.to raise_error('Wrong argument for --value option')
      end
    end
  end
end
