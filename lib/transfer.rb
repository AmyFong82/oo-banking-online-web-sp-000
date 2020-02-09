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
    sender = BankAccount.new(sender)
    receiver = BankAccount.new(receiver)
    sender.balance -= self.amount
  end

end
