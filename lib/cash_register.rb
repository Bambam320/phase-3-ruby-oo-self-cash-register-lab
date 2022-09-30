require 'pry'

class CashRegister
  attr_reader :discount, :items, :previous_item
  attr_accessor :total

  def initialize discount = 0
    @discount = discount
    @total = 0
    @items = []
    @previous_item = {:title => 'blank', :price => 0, :quantity => 0}
  end

  def add_item title, price, quantity = 1
    @total = @total + (price * quantity)
    quantity.times {|i| self.items=title }
    @previous_item[:title] = title
    @previous_item[:price] = price
    @previous_item[:quantity] = quantity
  end

  def apply_discount
    if @total == 0
      "There is no discount to apply."
    else
      @total = @total * (1 - discount/100.to_f)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items=item
    @items << item
  end

  def void_last_transaction
    @total = @total - (@previous_item[:price] * @previous_item[:quantity])
  end
end

