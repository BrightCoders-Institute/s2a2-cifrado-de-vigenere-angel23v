# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# Test for Cifrado de Vigenère:
class TestCifradoVigenere < Minitest::Test
  def setup
    @cifrado_one = Cifrado.new('hola', 'secreto')
    @cifrado_key = Cifrado.new('angel', 'celular')
    @cifrado_msg = Cifrado.new('rubyonrails', 'gema')
    @cifrado_word = Cifrado.new('java script', 'node js')
    @cifrado_default = Cifrado.new
  end

  def test_encrypt_word
    assert_equal 'ZSNR', @cifrado_one.display_encrypt
  end

  def test_key_bigger_than_msg
    assert_equal 'CRRYW', @cifrado_key.display_encrypt
  end

  def test_key_less_than_msg
    assert_equal 'XYNYURDAOPE', @cifrado_msg.display_encrypt
  end

  def test_more_than_one_word
    assert_equal 'WOYEBUEWSX', @cifrado_word.display_encrypt
  end

  def test_without_msgs
    assert_equal 'A', @cifrado_default.display_encrypt
  end
end
