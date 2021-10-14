# frozen_string_literal: true

require 'cipher_me_up/letters_and_numbers_shifter'
require 'cipher_me_up/string_helper'
Dir[File.join('./lib/cipher_me_up/ciphers/*.rb')].each { |file| require file }
