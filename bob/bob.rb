require 'ostruct'

module BobMessages
  QuestionMessage = OpenStruct.new(
    check: ->(msg) {  msg.end_with? "?" },
    response: "Sure."
  )
  ShoutingMessage = OpenStruct.new(
    check: ->(msg) {  msg == msg.upcase && msg.match(/[A-Z]/) },
    response: "Whoa, chill out!"
  )
  EmptyMessage    = OpenStruct.new(
    check: ->(msg) {  msg.to_s.empty? || !msg.match(/\w+/) },
    response: "Fine. Be that way!"
  )

  DefaultMessage = OpenStruct.new(call: OpenStruct.new(response: "Whatever."))
end

class Message
  attr_reader :response

  def initialize(msg, msg_module = BobMessages)
    Message.class_eval "include #{msg_module}"
    @response = find_response(msg)
  end

  def find_response(msg)
    @types = [EmptyMessage, ShoutingMessage, QuestionMessage]
    @types.find(DefaultMessage) { |type| type.check[msg] }.response
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
