require 'subscription_change_controller'

describe SubscriptionChangeController do
  let(:account) { double('account', update_subscription: true) }
  let(:finance) { double('finance', notify: true) }
  let(:sales)   { double('sales', notify: true) }

  it "updates the account" do
    expect(account).to receive(:update_subscription)
    SubscriptionChangeController.new(account).run
  end

  it "notifies finance -> generate invoice, handle payment" do
    expect(finance).to receive(:notify)
    SubscriptionChangeController.new(account, finance, sales).run
  end

  it "notifies sales -> gong, revenue change, and sfdc" do
    expect(sales).to receive(:notify)
    SubscriptionChangeController.new(account, finance, sales).run
  end


  it "notifies the the customer with an email"
  it "notifies partners"
  it "copies the attributes of the old subscription to the new one"
  it "updates the attributes of the new subscription"


end
