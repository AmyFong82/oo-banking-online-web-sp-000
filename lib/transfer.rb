require "pry"

class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? and self.receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.balance <= amount
      self.status = "rejected"
    elsif self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
      return
    end
  end

end
