class LinkedListItem
  # include Comparable

  @@count = 0
  def initialize(word)
    @@count += 1
    @payload = word
    @num = @@count
  end

  def payload
    @payload
  end

  def next_list_item= (item)
    if self != item
      @nextItem = item
    else
      raise ArgumentError
    end
  end

  def next_list_item
    @nextItem
  end

  def last?
    if @@count == @num
      true
    else
      false
    end
  end

  def > (item)
    item
  end

  # def == (item)
  #   true
  # end

end