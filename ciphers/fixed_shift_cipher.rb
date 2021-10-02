# frozen_string_literal: true

# This class is an adaptation to Caesar Cipher, allowing ciphering a word with letters and numbers only.
class FixedShiftCipher
  extend LettersAndNumbersShifter

  class << self
    def cipher(word, shift_factor: 3)
      return word unless shift_factor.positive?

      result = ''
      word.each_char do |char|
        shifted_value = if StringHelper.is_integer?(char)
                          shift(number: char,
                                shift_factor: shift_factor).to_s
                        else
                          shift(
                            letter: char, shift_factor: shift_factor
                          )
                        end
        result += shifted_value
      end

      result
    end

    def uncipher(word, unshift_factor: 3)
      return word unless unshift_factor.positive?

      result = ''
      word.each_char do |char|
        unshifted_value = if StringHelper.is_integer?(char)
                            unshift(number: char,
                                    shift_factor: unshift_factor).to_s
                          else
                            unshift(
                              letter: char, shift_factor: unshift_factor
                            )
                          end
        result += unshifted_value
      end

      result
    end
  end
end
