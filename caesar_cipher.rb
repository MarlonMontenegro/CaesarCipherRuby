# frozen_string_literal: true

class CaesarCipher

  def initialize(key)
    @key = key
  end

  def encrypt(message)

    encrypted_message = ""

    message.each_char do |char|
      if letter?(char)
        encrypted_char = encrypt_letter(char)
        encrypted_message += encrypted_char
      else
        encrypted_message += char
      end
    end
    encrypted_message
  end

  def letter?(char)
    ('a'..'z').include?(char.downcase)
  end


  def encrypt_letter(char)
    base = char.match?(/[A-Z]/) ? 'A' : 'a'
    key_amount = (@key % 26)
    rotated_position = (char.ord - base.ord + key_amount) % 26
    (base.ord + rotated_position).chr
  end

end

