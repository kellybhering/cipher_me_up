# frozen_string_literal: true

module CipherMeUp
  class MainCommand < Thor
    desc 'Ciphers WORD', "Ciphers a word with 'shift_factor' or 'keyword'"
    method_option :with, type: :string, aliases: '-w', required: true,
                         desc: "Type of ciphering to be used. It should be 'shift_factor' or 'keyword'"
    method_option :value, type: :string, aliases: '-v', required: true,
                          desc: "Value to be used when ciphering. It shoud be a number for 'shift_factor' or a word to 'keyword'"
    def word(word)
      # TODO: - Improve error handling
      with_option = options[:with] || options[:w]
      value_option = options[:value] || options[:v]

      raise 'Wrong argument for --with option' unless %w[shift_factor keyword].include?(with_option)

      case with_option
      when 'shift_factor'
        ciphered_word = FixedShiftCipher.cipher(word, shift_factor: value_option.to_i)
        raise unless ciphered_word
      when 'keyword'
        ciphered_word = ShiftByWordCipher.cipher(word, keyword: value_option)
        raise unless ciphered_word
      end

      puts ciphered_word
    rescue StandardError => e
      raise 'Wrong argument for --value option'
    end
  end
end
