# frozen_string_literal: true

class LettersAndNumbersShifter
  class << self
    def shift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number

      return shift_letter(letter, shift_factor) if letter
      shift_number(number, shift_factor)
    end

    def unshift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number

      return unshift_letter(letter, shift_factor) if letter
      unshift_number(number, shift_factor)
    end

    private

    def shift_letter(letter, shift_factor)
      amount_of_letters_to_shift = shift_factor % 26
      ('a'.ord + amount_of_letters_to_shift).chr
    end

    def unshift_letter(letter, shift_factor)
      amount_of_letters_to_unshift = shift_factor % 26
      ('z'.ord - amount_of_letters_to_unshift).chr
    end   
   
    def shift_number(letter, shift_factor)
      amount_of_numbers_to_shift = shift_factor % 10
      ('0'.ord + amount_of_numbers_to_shift).chr
    end

    def unshift_number(letter, shift_factor)
      amount_of_numbers_to_unshift = shift_factor % 10
      ('9'.ord - amount_of_numbers_to_unshift).chr
    end
  end
end