# frozen_string_literal: true

describe ShiftByWordCipher do
  describe '.cipher' do
    subject { described_class.cipher(word, keyword: keyword) }

    context 'with an empty keyword' do
      let(:keyword) { '' }
      let(:word) { 'HelloWord123!' }

      it 'should return the word the same as informed' do
        is_expected.to eq('HelloWord123!')
      end
    end

    context 'without a keyword' do
      let(:keyword) { nil }
      let(:word) { 'HelloWord123!' }

      it 'should return the word the same as informed' do
        is_expected.to eq('HelloWord123!')
      end
    end

    context 'with a keyword containing numbers' do
      let(:keyword) { 'ABc1' }
      let(:word) { 'HelloWord123!' }

      it 'should return nil' do
        is_expected.to be nil
      end
    end

    context 'with a keyword containing special characters' do
      let(:keyword) { 'ABc!' }
      let(:word) { 'HelloWord123!' }

      it 'should return nil' do
        is_expected.to be nil
      end
    end

    context 'with the keyword ABc and the word HelloWord123!' do
      let(:keyword) { 'ABc' }
      let(:word) { 'HelloWord123!' }

      it 'should return HfnlpYosf135!' do
        is_expected.to eq('HfnlpYosf135!')
      end
    end

    context 'with the keyword ABc and the word HelloWord123!' do
      let(:keyword) { 'ABc' }
      let(:word) { 'HzlloWord123!' }

      it 'should return HanlpYosf135!' do
        is_expected.to eq('HanlpYosf135!')
      end
    end
  end

  describe '.uncipher' do
    subject { described_class.uncipher(word, keyword: keyword) }

    context 'with an empty keyword' do
      let(:keyword) { '' }
      let(:word) { 'HfnlpYosf135!' }

      it 'should return the word the same as informed' do
        is_expected.to eq('HfnlpYosf135!')
      end
    end

    context 'without a keyword' do
      let(:keyword) { nil }
      let(:word) { 'HfnlpYosf135!' }

      it 'should return the word the same as informed' do
        is_expected.to eq('HfnlpYosf135!')
      end
    end

    context 'with a keyword containing numbers' do
      let(:keyword) { 'ABc1' }
      let(:word) { 'HfnlpYosf135!' }

      it 'should return nil' do
        is_expected.to be nil
      end
    end

    context 'with a keyword containing special characters' do
      let(:keyword) { 'ABc!' }
      let(:word) { 'HfnlpYosf135!' }

      it 'should return nil' do
        is_expected.to be nil
      end
    end

    context 'with the keyword ABc and the word HfnlpYosf135!' do
      let(:keyword) { 'ABc' }
      let(:word) { 'HfnlpYosf135!' }

      it 'should return HelloWord123!' do
        is_expected.to eq('HelloWord123!')
      end
    end

    context 'with the keyword ABc and the word HanlpYosf135!' do
      let(:keyword) { 'ABc' }
      let(:word) { 'HanlpYosf135!' }

      it 'should return HzlloWord123!' do
        is_expected.to eq('HzlloWord123!')
      end
    end
  end
end
