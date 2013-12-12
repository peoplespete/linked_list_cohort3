
class LinkedListItem
  include Comparable

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

  def <=> (item)
    if self.payload.class != item.payload.class
      sc = self.payload.class
      ic = item.payload.class
      if sc == Symbol
        sz = 3
      elsif sc == String
        sz = 2
      elsif sc == Fixnum
        sz = 1
      end
      if ic == Symbol
        iz = 3
      elsif ic == String
        iz = 2
      elsif ic == Fixnum
        iz = 1
      end
      sz <=> iz
    else
      self.payload <=> item.payload
    end
  end

  def === (item)
    self.object_id === item.object_id
  end
end