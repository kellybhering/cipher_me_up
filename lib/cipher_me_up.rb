require 'byebug'

Dir[File.join('./strategies/*.rb')].each { |file| require file }