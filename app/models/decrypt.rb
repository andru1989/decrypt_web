class Decrypt
  attr_accessor :message, :key

  def initialize(text = '', key = '')
    self.message  = text
    self.key      = key
  end

  def run
    key.reverse.split('/').map.with_index{|v,i| alphabet_hash.merge!("#{v}" => alphabet[i])}

    {message: message.reverse.split('/').map{|n| alphabet_hash[n] || ' '}.join}
  end

  def alphabet
    ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def alphabet_hash
    @alphabet_hash ||= {}
  end

end