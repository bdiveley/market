class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.length == 0
      0
    else
      found = @inventory.find do |key, value|
        key == item
      end.last
    end
  end

  def stock(item, amount)
    found = @inventory.find do |key, value|
        key == item
      end
    if found != nil
      @inventory[found[0]] += amount
    else
      @inventory[item] = amount
    end
  end


end
