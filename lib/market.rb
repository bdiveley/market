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
end
