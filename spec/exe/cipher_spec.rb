# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'cipher script' do
  context 'when the script is loaded' do
    it 'should call CipherMeUp::MainCommand thor class' do
      allow(CipherMeUp::MainCommand).to receive(:start)

      load 'exe/cipher'

      expect(CipherMeUp::MainCommand).to have_received(:start).with(ARGV)
    end
  end
end
