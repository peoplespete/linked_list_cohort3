
class LinkedListItem
  include Comparable

  def initialize(word)
    @payload = word
  end

  # def changeLLI(lli)
  #   self = lli
  # end

  def payload
    @payload
  end

  def payload= (newPayload)
    @payload = newPayload
  end

  def next_list_item= (item)
    if self.object_id != item.object_id
      @nextItem = item
    else
      raise ArgumentError
    end
  end

  def next_list_item
    @nextItem
  end

  def last?
    next_list_item.nil?
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