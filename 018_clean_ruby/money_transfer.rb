# Objects source and destination are playing roles
# The Transferrer module is called a Methodful Role which adds methods to the data objects
# The MoneyTransfer class is called the Methodless Role

class MoneyTransfer
  def initialize(source, destination)
    @source = source
    @destination = destination
    assign_transferrer(@source)
  end

  def execute(amount)
    @source.transfer_to(@destination, amount)
  end

  private

  def assign_transferrer(account)
    account.extend(Transferrer)
  end

  module Transferrer
    def transfer_to(destination, amount)
      self.balance -= amount
      destination.balance += amount
    end
  end
end
