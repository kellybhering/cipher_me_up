# frozen_string_literal: true

module LettersAndNumbersShifter
  def self.extended(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def shift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number
      return letter if letter && !valid_letter?(letter)
      return number if number && !valid_number?(number)

      return shift_letter(letter, shift_factor) if letter

      shift_number(number, shift_factor)
    end

    def unshift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number
      return letter if letter && !valid_letter?(letter)
      return number if number && !valid_number?(number)

      return unshift_letter(letter, shift_factor) if letter

      unshift_number(number, shift_factor)
    end

    private

    def shift_letter(letter, shift_factor)
      is_uppercase?(letter) ? shift_uppercase(letter, shift_factor) : shift_downcase(letter, shift_factor)
    end

    def shift_uppercase(letter, shift_factor)
      qty_of_positions_from_a = letter.ord - 'A'.ord
      qty_of_letters_to_shift = (shift_factor + qty_of_positions_from_a) % 26
      ('A'.ord + qty_of_letters_to_shift).chr
    end

    def shift_downcase(letter, shift_factor)
      qty_of_positions_from_a = letter.ord - 'a'.ord
      qty_of_letters_to_shift = (shift_factor + qty_of_positions_from_a) % 26
      ('a'.ord + qty_of_letters_to_shift).chr
    end

    def unshift_letter(letter, shift_factor)
      is_uppercase?(letter) ? unshift_uppercase(letter, shift_factor) : unshift_downcase(letter, shift_factor)
    end

    def unshift_uppercase(letter, shift_factor)
      qty_of_positions_from_z = 'Z'.ord - letter.ord
      qty_of_letters_to_unshift = (shift_factor + qty_of_positions_from_z) % 26
      ('Z'.ord - qty_of_letters_to_unshift).chr
    end

    def unshift_downcase(letter, shift_factor)
      qty_of_positions_from_z = 'z'.ord - letter.ord
      qty_of_letters_to_unshift = (shift_factor + qty_of_positions_from_z) % 26
      ('z'.ord - qty_of_letters_to_unshift).chr
    end

    def shift_number(number, shift_factor)
      qty_of_positions_from_zero = number.to_s.ord - '0'.ord
      qty_of_numbers_to_shift = (shift_factor + qty_of_positions_from_zero) % 10
      ('0'.ord + qty_of_numbers_to_shift).chr.to_i
    end

    def unshift_number(number, shift_factor)
      qty_of_positions_from_nine = '9'.ord - number.to_s.ord
      qty_of_numbers_to_unshift = (shift_factor + qty_of_positions_from_nine) % 10
      ('9'.ord - qty_of_numbers_to_unshift).chr.to_i
    end

    def valid_letter?(letter)
      /[a-zA-Z]/.match?(letter)
    end

    def valid_number?(number)
      /\d/.match?(number.to_s)
    end

    def is_uppercase?(letter)
      /[A-Z]/.match?(letter)
    end
  end

  extend self
end
