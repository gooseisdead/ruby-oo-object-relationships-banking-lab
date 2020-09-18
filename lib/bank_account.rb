class BankAccount 
    attr_accessor :balance, :status
    attr_reader :name
    attr_writer

    @@all = []
      
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self  
    end

    def self.all
        @@all
    end

    def deposit(amount)
        @balance +=amount
    end

    def display_balance
        p "Your balance is $#{@balance}."
    end

    def valid?
        if self.status == "open" && self.balance > 0
            return true
        else 
            return false
        end
    end

    def close_account
        @status = "closed"
        @balance = 0
    end
end