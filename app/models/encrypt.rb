class Encrypt
  attr_accessor :message

  def initialize(message)
    self.message = message.split('')
  end

  def run
    fill_hash && fill_alphabet

    {key: hash.keys.join('/').reverse, message: array.reverse}
  end

  def array
    message.map do |letter|
      hash.value?(letter) ? hash.select{|k,v| v == letter}.first[0] : letter
    end.join('/')
  end

  def fill_hash
    (1..99).to_a.shuffle.take(52).map{|n| hash.merge!("#{n}" => '')}
  end

  def fill_alphabet
    hash.keys.map.with_index{|k,i| hash[k] = alphabet[i]}
    hash.merge!('0' => ' ')
  end

  def alphabet
    ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def hash
    @hash ||= {}
  end

end