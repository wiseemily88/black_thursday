require 'bigdecimal'
require 'pry'

class SalesAnalyst

  def initialize(sales_engine)
    @se = sales_engine
  end

  def average_items_per_merchant
    merchants = @se.merchants.all.count
    items = @se.items.all.count
    items / merchants
  end

  def average_average_price_per_merchant
    average(@se.merchants.all){ |merchant| average_item_price(merchant) }
  end

  def average_item_price_for_merchant(id)
    merchant = @se.merchants.find_by_id(id)
    average_item_price(merchant)
  end

  def average_item_price(merchant)
    average(merchant.items){ |item| item.unit_price }
  end

  def average_items_per_merchant_standard_deviation
    average_count = average_items_per_merchant
    sum_of_squares = @se.merchants.reduce(0) do |sum, merchant|
      sum + (merchant.items.count - average_count) ** 2
    end

    Math.sqrt(sum_of_squares / (@se.merchants.all.count - 1))
  end

  def average(enum)
    count = enum.count

    sum = enum.reduce(0) do |sum, element|
      element = yield element if block_given?
      unless element.nil?
        sum + element
      else
        count -= 1
        sum
      end
    end
    return nil if count.zero?
    sum / count
  end

end
