# frozen_string_literal: true

require 'byebug'

require 'letters_and_numbers_shifter'
Dir[File.join('./strategies/*.rb')].each { |file| require file }
