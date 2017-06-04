class BalanceNotifier < Rectify::Command
  def initialize(balance, currency)
    @balance = balance
    @currency = currency
  end

  def call
    @balance.mark_as_notified!

    UserMailer.take_profit_email(@balance).deliver_later
  end
end
