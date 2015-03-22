class Message
  attr_reader :response

  def initialize(msg)
    @msg  = msg
    @response = find_response
  end

  def find_response
    @types = [EmptyMessage, ShoutingMessage, QuestionMessage]
    @types.find(DefaultMessage) { |type| type.check(@msg) }.response
  end
end

class EmptyMessage
  def self.check(msg)
    msg.to_s.empty? || !msg.match(/\w+/)
  end

  def self.response
    "Fine. Be that way!"
  end
end

class QuestionMessage
  def self.check(msg)
    msg.end_with? "?"
  end

  def self.response
    "Sure."
  end
end

class ShoutingMessage
  def self.check(msg)
    msg == msg.upcase && msg.match(/[A-Z]/)
  end

  def self.response
    "Whoa, chill out!"
  end
end

class DefaultMessage
  def self.call
    self
  end

  def self.response
    "Whatever."
  end
end


module Responder
  def hey(msg)
    message = Message.new(msg)
    message.response
  end
end

class Bob
  include Responder
end
