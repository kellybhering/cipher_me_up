# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LettersAndNumbersShifter do
  describe '.shift' do
    it 'should return nil when trying to shift letter and number together' do
      expect(LettersAndNumbersShifter.shift(letter: 'a', number: 9)).to be nil
    end

    it 'should return nil when trying to shift no letter or number' do
      expect(LettersAndNumbersShifter.shift(letter: nil, number: nil)).to be nil
    end

    context 'when extended by a class' do
      let(:dummy_class) { Class.new { extend LettersAndNumbersShifter } }

      it 'should be able to call shift method' do
        expect(dummy_class.singleton_methods).to include(:shift)
      end
    end

    context 'with an invalid value for letter' do
      it 'should return itself when trying to shift & as a letter' do
        expect(LettersAndNumbersShifter.shift(letter: '&')).to eq('&')
      end

      it 'should return itself when trying to shift 9 as a letter' do
        expect(LettersAndNumbersShifter.shift(letter: '9')).to eq('9')
      end
    end

    context 'with an invalid value for number' do
      it 'should return itself when trying to shift & as a number' do
        expect(LettersAndNumbersShifter.shift(number: '&')).to eq('&')
      end

      it 'should return itself when trying to shift a as a number' do
        expect(LettersAndNumbersShifter.shift(number: 'a')).to eq('a')
      end
    end

    context 'with a letter and the default shift factor' do
      it 'should return b when shifting a' do
        expect(LettersAndNumbersShifter.shift(letter: 'a')).to eq('b')
      end

      it 'should return B when shifting A' do
        expect(LettersAndNumbersShifter.shift(letter: 'A')).to eq('B')
      end

      it 'should return a when shifting z' do
        expect(LettersAndNumbersShifter.shift(letter: 'z')).to eq('a')
      end

      it 'should return A when shifting Z' do
        expect(LettersAndNumbersShifter.shift(letter: 'Z')).to eq('A')
      end

      it 'should return c when shifting b' do
        expect(LettersAndNumbersShifter.shift(letter: 'b')).to eq('c')
      end

      it 'should return C when shifting B' do
        expect(LettersAndNumbersShifter.shift(letter: 'B')).to eq('C')
      end
    end

    context 'with a letter and an informed shift factor' do
      it 'should return z when shifting a by 25' do
        expect(LettersAndNumbersShifter.shift(letter: 'a', shift_factor: 25)).to eq('z')
      end

      it 'should return Z when shifting A by 25' do
        expect(LettersAndNumbersShifter.shift(letter: 'A', shift_factor: 25)).to eq('Z')
      end

      it 'should return a when shifting a by 26' do
        expect(LettersAndNumbersShifter.shift(letter: 'a', shift_factor: 26)).to eq('a')
      end

      it 'should return A when shifting A by 26' do
        expect(LettersAndNumbersShifter.shift(letter: 'A', shift_factor: 26)).to eq('A')
      end

      it 'should return q when shifting c by 118' do
        expect(LettersAndNumbersShifter.shift(letter: 'c', shift_factor: 118)).to eq('q')
      end

      it 'should return Q when shifting C by 118' do
        expect(LettersAndNumbersShifter.shift(letter: 'C', shift_factor: 118)).to eq('Q')
      end
    end

    context 'with a number and the default shift factor' do
      it 'should return 0 when shifting 9' do
        expect(LettersAndNumbersShifter.shift(number: 9)).to eq(0)
      end

      it 'shoud return 3 when shifting 2' do
        expect(LettersAndNumbersShifter.shift(number: 2)).to eq(3)
      end
    end

    context 'with a number and an informed shift factor' do
      it 'should return 4 when shifting 0 by 34' do
        expect(LettersAndNumbersShifter.shift(number: 0, shift_factor: 34)).to eq(4)
      end

      it 'should return 0 when shifting 3 by 57' do
        expect(LettersAndNumbersShifter.shift(number: 3, shift_factor: 57)).to eq(0)
      end
    end
  end

  describe '.unshift' do
    it 'should return nil when trying to unshift letter and number together' do
      expect(LettersAndNumbersShifter.unshift(letter: 'a', number: 9)).to be nil
    end

    it 'should return nil when trying to unshift no letter or number' do
      expect(LettersAndNumbersShifter.unshift(letter: nil, number: nil)).to be nil
    end

    context 'when extended by a class' do
      let(:dummy_class) { Class.new { extend LettersAndNumbersShifter } }

      it 'should be able to call unshift method' do
        expect(dummy_class.singleton_methods).to include(:unshift)
      end
    end

    context 'with an invalid value for letter' do
      it 'should return itself when trying to unshift & as a letter' do
        expect(LettersAndNumbersShifter.unshift(letter: '&')).to eq('&')
      end

      it 'should return itself when trying to unshift 9 as a letter' do
        expect(LettersAndNumbersShifter.unshift(letter: '9')).to eq('9')
      end
    end

    context 'with an invalid value for number' do
      it 'should return itself when trying to unshift & as a number' do
        expect(LettersAndNumbersShifter.unshift(number: '&')).to eq('&')
      end

      it 'should return itself when trying to unshift a as a number' do
        expect(LettersAndNumbersShifter.unshift(number: 'a')).to eq('a')
      end
    end

    context 'with a letter and the default unshift factor' do
      it 'should return z when unshifting a' do
        expect(LettersAndNumbersShifter.unshift(letter: 'a')).to eq('z')
      end

      it 'should return Z when unshifting A' do
        expect(LettersAndNumbersShifter.unshift(letter: 'A')).to eq('Z')
      end

      it 'should return y when unshifting z' do
        expect(LettersAndNumbersShifter.unshift(letter: 'z')).to eq('y')
      end

      it 'should return Y when unshifting Z' do
        expect(LettersAndNumbersShifter.unshift(letter: 'Z')).to eq('Y')
      end
    end

    context 'with a letter and an informed unshift factor' do
      it 'should return a when unshifting z by 25' do
        expect(LettersAndNumbersShifter.unshift(letter: 'z', shift_factor: 25)).to eq('a')
      end

      it 'should return A when unshifting Z by 25' do
        expect(LettersAndNumbersShifter.unshift(letter: 'Z', shift_factor: 25)).to eq('A')
      end

      it 'should return z when unshifting z by 26' do
        expect(LettersAndNumbersShifter.unshift(letter: 'z', shift_factor: 26)).to eq('z')
      end

      it 'should return Z when unshifting Z by 26' do
        expect(LettersAndNumbersShifter.unshift(letter: 'Z', shift_factor: 26)).to eq('Z')
      end

      it 'should return c when unshifting q by 118' do
        expect(LettersAndNumbersShifter.unshift(letter: 'q', shift_factor: 118)).to eq('c')
      end

      it 'should return C when unshifting Q by 118' do
        expect(LettersAndNumbersShifter.unshift(letter: 'Q', shift_factor: 118)).to eq('C')
      end
    end

    context 'with a number and the default unshift factor' do
      it 'should return 9 when unshifting 0' do
        expect(LettersAndNumbersShifter.unshift(number: 0)).to eq(9)
      end

      it 'should return 9 when unshifting "0"' do
        expect(LettersAndNumbersShifter.unshift(number: '0')).to eq(9)
      end

      it 'should return 2 when unshifting 3' do
        expect(LettersAndNumbersShifter.unshift(number: 3)).to eq(2)
      end
    end

    context 'with a number and an informed unshift factor' do
      it 'should return 0 when unshifting 4 by 34' do
        expect(LettersAndNumbersShifter.unshift(number: 4, shift_factor: 34)).to eq(0)
      end

      it 'should return 3 when unshifting 0 by 57' do
        expect(LettersAndNumbersShifter.unshift(number: 0, shift_factor: 57)).to eq(3)
      end
    end
  end
end
