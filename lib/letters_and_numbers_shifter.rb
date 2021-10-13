# frozen_string_literal: true

module LettersAndNumbersShifter
  def self.extended(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def shift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number
      return letter if letter && !StringHelper.valid_letter?(letter)
      return number if number && !StringHelper.valid_number?(number)

      return shift_letter(letter, shift_factor) if letter

      shift_number(number, shift_factor)
    end

    def unshift(letter: nil, number: nil, shift_factor: 1)
      return unless letter || number
      return if letter && number
      return letter if letter && !StringHelper.valid_letter?(letter)
      return number if number && !StringHelper.valid_number?(number)

      return unshift_letter(letter, shift_factor) if letter

      unshift_number(number, shift_factor)
    end

    private

    def shift_letter(letter, shift_factor)
      StringHelper.is_uppercase?(letter) ? shift_uppercase(letter, shift_factor) : shift_downcase(letter, shift_factor)
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
      if StringHelper.is_uppercase?(letter)
        unshift_uppercase(letter,
                          shift_factor)
      else
        unshift_downcase(letter, shift_factor)
      end
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
  end

  extend self
end
