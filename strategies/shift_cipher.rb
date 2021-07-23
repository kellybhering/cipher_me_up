# frozen_string_literal: true

# This class is an adaptation to Caesar Cipher, allowing ciphering of letters and numbers only. 
class ShiftCipher
  class << self
    def cipher(text, shift_factor: 3)
      result = ''
      text.each_char { |char| result += shift_char(char, shift_factor) }

      result
    end

    def uncipher(text, unshift_factor: 3)
      result = ''
      text.each_char { |char| result += unshift_char(char, unshift_factor) }

      result
    end

    private

    def shift_char(char, shift_factor)
      return ('a'.ord + shift_factor - 1).chr if char == 'z'
      return ('0'.ord - shift_factor - 1).chr if char == '9'

      (char.ord + shift_factor).chr
    end

    def unshift_char(char, unshift_factor)
      return ('z'.ord - unshift_factor - 1).chr if char == 'a'
      return ('9'.ord - unshift_factor - 1).chr if char == '0'

      (char.ord - unshift_factor).chr
    end
  end
end
