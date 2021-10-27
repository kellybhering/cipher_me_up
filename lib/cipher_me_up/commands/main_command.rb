# frozen_string_literal: true

module CipherMeUp
  class MainCommand < Thor
    desc 'Ciphers WORD', "Ciphers a word with 'shift_factor' or 'keyword'"
    method_option :with, alias: '-w', type: :string, required: true,
                         desc: "Type of ciphering to be used. It should be 'shift_factor' or 'keyword'"
    method_option :value, alias: '-v', type: :string, required: true,
                          desc: "Value to be used when ciphering. It shoud be a number for 'shift_factor' or a word to 'keyword'"
    def word(word)
      raise 'Wrong argument for --with option' unless %w[shift_factor keyword].include?(options[:with])

      case options[:with]
      when 'shift_factor'
        ciphered_word = FixedShiftCipher.cipher(word, shift_factor: options[:value].to_i)
        raise unless ciphered_word
      when 'keyword'
        ciphered_word = ShiftByWordCipher.cipher(word, keyword: options[:value])
        raise unless ciphered_word
      end

      puts ciphered_word
    rescue StandardError => e
      raise 'Wrong argument for --value option'
    end
  end
end
