# frozen_string_literal: true

# This class is an adaptation to Caesar Cipher, allowing ciphering a word with letters and numbers only. 
class FixedShiftCipher
  class << self
    def cipher(word, shift_factor: 3)
      return word unless shift_factor > 0

      result = ''
      word.each_char { |char| result += shift_char(char, shift_factor) }

      result
    end

    def uncipher(word, unshift_factor: 3)
      return word unless unshift_factor > 0

      result = ''
      word.each_char { |char| result += unshift_char(char, unshift_factor) }

      result
    end

    private

    def shift_char(char, shift_factor)
      return char if char == '_' || /\W/.match?(char)
      return ('a'.ord + shift_factor - 1).chr if char == 'z'
      return ('A'.ord + shift_factor - 1).chr if char == 'Z'
      return ('0'.ord + shift_factor - 1).chr if char == '9'

      (char.ord + shift_factor).chr
    end

    def unshift_char(char, unshift_factor)
      return char if char == '_' || /\W/.match?(char)
      return ('z'.ord - unshift_factor + 1).chr if char == 'a'
      return ('Z'.ord - unshift_factor + 1).chr if char == 'A'
      return ('9'.ord - unshift_factor + 1).chr if char == '0'

      (char.ord - unshift_factor).chr
    end
  end
end
