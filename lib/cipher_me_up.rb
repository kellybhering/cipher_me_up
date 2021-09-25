# frozen_string_literal: true

require 'byebug'

Dir[File.join('./strategies/*.rb')].each { |file| require file }
require 'letters_and_numbers_shifter'
