# This is a project I made for class

class LinkedList
  attr_reader :head, :current
  def initialize (*payload)
    @count = 0
    unless payload == []
      payload.each do |pl|
        self.add_item(pl)
      end
    end
  end

  def add_item (payload)

    lli = LinkedListItem.new(payload)
    @current.next_list_item = lli if @current
    @current = lli
    @head = lli if @count == 0
    @count += 1

  end

  def indexOf(payload)
    index = 0
    @count.times do
      if get(index) == payload
        return index
        break
      end
      index += 1
    end
    nil
  end

  def [](index)
    get(index)
  end
  def []= (index, newPayload)
    self.get(index, true).payload = newPayload
  end

  def get (index, allLLI = nil)
    if @head and (index >= 0)
      current = @head
      index.times do
        if current.next_list_item
          current = current.next_list_item
        else
          raise IndexError
        end
      end
      if allLLI
        current
      else
        current.payload
      end
    else
      raise IndexError
    end

  end

  def size
    @count
  end

  def remove(index)
    if index == 0
      @head = self.get(index+1, true)
    else
      self.get(index-1, true).next_list_item = self.get(index, true).next_list_item
    end
    @count -= 1

  end

  def last
    if @head
      current = @head
      @count.times do
        if current.next_list_item
          current = current.next_list_item
        end
      end
      current.payload
    else
      nil
    end
  end

  def to_s
    @string = '| '
    current = @head
      @count.times do
        @string << current.payload
        if current.next_list_item
          @string << ', '
          current = current.next_list_item
        else
          @string << ' '
        end
      end
    @string << '|'
    @string
  end

end




