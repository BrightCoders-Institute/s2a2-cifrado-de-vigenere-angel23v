# frozen_string_literal: true

# classs
class Cifrado
  attr_accessor(:original_message, :key)

  def initialize(original_message = 'a', key = 'a')
    # get the words and make it upcase, after in an array and finally put them together in an array
    # if there is more than a word.
    @original_message = original_message.upcase.split.join
    @key = key.upcase.split.join
    @cifrado = ('A'..'Z').to_a
  end

  def encrypt_word(word)
    # Change type word in a array and get the index of each letter
    word.split('').map do |letter|
      @cifrado.index(letter)
    end
  end

  def complete_message?
    # loop over message for concat key letters until get the same lenght of word message
    message = @original_message
    key = @key

    return key unless message.length > key.length

    message.each_char.with_index do |_, index|
      key += key[index]
    end
    key
  end

  def index_sum
    # get the sum of each index letter
    message = encrypt_word(@original_message)

    key_complete = complete_message?
    key_encrypt = encrypt_word(key_complete)

    message.map.with_index do |ele, index|
      ele + key_encrypt[index]
    end
  end

  def calculate_correct_index
    # fix if the sum is bigger than cifrado which is the array with the letters
    index_sum.map do |sum|
      if @cifrado.length <= sum
        sum - @cifrado.length
      else
        sum
      end
    end
  end

  def display_encrypt
    # display the correct encrypt message looping over an array
    # who has the correct sum and get the letter by the index sum
    encrypt_message = ''

    calculate_correct_index.each do |idx_sum_ele|
      encrypt_message += @cifrado[idx_sum_ele]
    end
    puts "Encrypt message: #{encrypt_message}"
    encrypt_message
  end
end

g = Cifrado.new('zk', 'zwy')
g.display_encrypt
