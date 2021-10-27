# frozen_string_literal: true

# This class is inspired by Vigenere Cipher, allowing ciphering a word with letters and numbers only, depending on a word to shift the characters dinamically.
class ShiftByWordCipher
  extend LettersAndNumbersShifter

  class << self
    def cipher(word, keyword:)
      return word unless word && keyword && !keyword.empty?
      return unless StringHelper.are_letters_only?(keyword)

      adapted_key_word = adapt_key_word(keyword, word.size)

      result = ''
      index = 0

      word.each_char do |char|
        shifted_value = if StringHelper.is_integer?(char)
                          shift(number: char,
                                shift_factor: find_shift_factor(adapted_key_word[index])).to_s
                        else
                          shift(
                            letter: char, shift_factor: find_shift_factor(adapted_key_word[index])
                          )
                        end
        result += shifted_value
        index += 1
      end

      result
    end

    def uncipher(word, keyword:)
      return word unless word && keyword && !keyword.empty?
      return unless StringHelper.are_letters_only?(keyword)

      result = ''
      index = 0

      adapted_key_word = adapt_key_word(keyword, word.size)

      word.each_char do |char|
        unshifted_value = if StringHelper.is_integer?(char)
                            unshift(number: char,
                                    shift_factor: find_shift_factor(adapted_key_word[index])).to_s
                          else
                            unshift(
                              letter: char, shift_factor: find_shift_factor(adapted_key_word[index])
                            )
                          end
        result += unshifted_value
        index += 1
      end

      result
    end

    private

    def adapt_key_word(word, final_size)
      final_key = ''

      final_key += word while final_key.size < final_size

      final_key.slice(0..(final_size - 1))
    end

    def find_shift_factor(key_letter)
      return key_letter.ord - 'A'.ord if StringHelper.is_uppercase?(key_letter)

      key_letter.ord - 'a'.ord
    end
  end
end
