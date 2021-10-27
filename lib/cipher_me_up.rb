# frozen_string_literal: true

require 'thor'
require './lib/cipher_me_up/letters_and_numbers_shifter'
require './lib/cipher_me_up/string_helper'
Dir[File.join('./lib/cipher_me_up/ciphers/*.rb')].each { |file| require file }
Dir[File.join('./lib/cipher_me_up/commands/*.rb')].each { |file| require file }
