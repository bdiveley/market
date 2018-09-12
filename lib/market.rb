class Market
    attr_reader :name,
                :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(new_vendor)
    @vendors << new_vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.find do |key, value|
        key == item
      end
    end
  end

  def sorted_item_list
    list = @vendors.map do |vendor|
      vendor.inventory.keys
    end
    list.flatten.sort.uniq
  end

  def total_inventory
    new_hash = Hash.new(0)
    @vendors.reduce(new_hash) do |hash, vendor|
      vendor.inventory.map do |key, value|
        hash[key] += value
      end
    end
  end
end
