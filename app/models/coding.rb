class Coding

  attr_accessor :message

  def self.encrypt(message)
    Encrypt.new(message).run
  end

  def self.decrypt(message, key)
    Decrypt.new(message, key).run
  end

end