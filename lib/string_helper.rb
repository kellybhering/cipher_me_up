# frozen_string_literal: true

# The purpose of this class is to be a centralized way to deal with string operations
class StringHelper
  class << self
    def is_integer?(char)
      char.to_i.to_s == char
    end

    def is_uppercase?(letter)
      /[A-Z]/.match?(letter)
    end

    def are_letters_only?(word)
      !word.empty? && !/[\W\d]/.match?(word)
    end

    def valid_letter?(letter)
      /[a-zA-Z]/.match?(letter)
    end

    def valid_number?(number)
      /\d/.match?(number.to_s)
    end
  end
end
