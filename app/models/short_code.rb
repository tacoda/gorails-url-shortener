class ShortCode
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  BASE = ALPHABET.length

  def self.encode(number)
    return ALPHABET.first if number.zero? || number.nil?

    result = String.new

    while number > 0
      index = number % BASE
      char = ALPHABET[index]
      result.prepend(char)
      number = number / BASE
    end

    result
  end

  def self.decode(string)
    number = 0

    string.reverse.each_char.with_index do |char, index|
      power = BASE ** index
      index = ALPHABET.index(char)
      number += index * power
    end

    number
  end
end
