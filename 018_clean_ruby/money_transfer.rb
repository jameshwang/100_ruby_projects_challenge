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
