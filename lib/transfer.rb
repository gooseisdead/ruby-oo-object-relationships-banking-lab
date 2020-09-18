require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader 
  attr_writer

  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def self.all
    @@all 
  end

  def valid?
    if @sender.valid? && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance >= @amount && @status == "pending" && self.valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete" 
    else
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" 
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end
 
end