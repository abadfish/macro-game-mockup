class Trade < ActiveRecord::Base
  belongs_to :user

  def self.update_current_prices
    api = API.new
    self.all.each do |trade|
      current_price = api.get_current_price(trade.product)
      trade.update(current_price: current_price)
    end
  end
end
