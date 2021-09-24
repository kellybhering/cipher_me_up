# frozen_string_literal: true

require 'spec_helper'

describe LettersAndNumbersShifter do
  describe '.shift' do
    context 'with a letter and the default shift factor' do
      it 'should return b when shifting a' do
        expect(described_class.shift()).to eq()
      end

      it 'should return a when shifting z' do
      end      
    end

    context 'with a letter and an informed shift factor' do
      it 'should return z when shifting a by 25' do
      end

      it 'should return a when shifting a by 25' do
      end

      it 'should return q when shifting c by 118' do
      end
    end

    context 'with a number and the default shift factor' do
      it 'should return 0 when shifting 9' do
      end

      it 'shoud return 3 when shifting 2' do
      end
    end

    context 'with a number and an informed shift factor' do
      it 'should return 4 when shifting 0 by 34' do
      end

      it 'should return 0 when shifting 3 by 57' do
      end
    end
  end

  describe '.unshift' do
    context 'with a letter and the default shift factor' do
      it 'should return z when unshifting a' do
      end

      it 'should return y when unshifting z' do
      end  
    end

    context 'with a letter informed shift factor' do
      it 'should return a when unshifting z by 25' do
      end

      it 'should return z when unshifting z by 25' do
      end

      it 'should return c when unshifting q by 118' do
      end
    end

    context 'with a number and the default shift factor' do
      it 'should return 9 when unshifting 0' do
      end

      it 'shoud return 2 when unshifting 3' do
      end
    end

    context 'with a number and an informed shift factor' do
      it 'should return 0 when unshifting 4 by 34' do
      end

      it 'should return 3 when unshifting 0 by 57' do
      end
    end
  end
end