class SubscriptionChangeController
  attr_reader :account, :finance, :sales
  def initialize(account, finance = nil, sales = nil)
    @account = account
    @finance = finance
    @sales   = sales
  end

  def run
    account.update_subscription
    finance.notify if finance
    sales.notify if sales
  end
end
