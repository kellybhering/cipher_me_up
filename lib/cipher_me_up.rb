# frozen_string_literal: true

require 'byebug'

require 'letters_and_numbers_shifter'
require 'string_helper'
Dir[File.join('./ciphers/*.rb')].each { |file| require file }
