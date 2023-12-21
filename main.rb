# ddd

class Cifrado

  attr_accessor(:original_message, :key)

  def initialize(original_message, key)
    @original_message = original_message.upcase
    @key = key.upcase
    @cifrado = ('A'..'Z').to_a
  end

  def encrypt_word(word)
    word.split('').map do |letter|
      @cifrado.index(letter)
    end
  end

  def call_method
    message = encrypt_word(@original_message)
    puts ''
    key = encrypt_word(@key)

    message.map.with_index do |ele, index|
      ele + key[index]
    end
  end
end

g = Cifrado.new('dahlia', 'angel')
g.call_method
