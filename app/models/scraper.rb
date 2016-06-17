class API
  attr_accessor :product, :price
  def initialize
    @url = "http://www.barchart.com/quotes/futures.json"
  end

  def get_current_price(product)
    rand(10000).to_f
  end
  def self.scrape_barchart



  end

end
