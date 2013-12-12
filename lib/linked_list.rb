require 'linked_list_item'

class LinkedList
  attr_reader :head, :current
  def initialize (name = nil)
    @count = 0
    @name = name
  end

  def add_item (payload)

    lli = LinkedListItem.new(payload)
    lli.next_list_item = nil
    @current.next_list_item = lli if @current
    @current = lli
    @head = lli if @count == 0
    @count += 1

  end

  def get (index)
    # should return the item for that index
    if @head and (index >=0)
      current = @head
      index.times do
        if current.next_list_item
          current = current.next_list_item
        else
          raise IndexError
        end
      end
      current.payload
    else
      raise IndexError
    end

  end

  def size
    @count
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
    if @count > 0
      string = '| '
      current = @head
        @count.times do
          string += current.payload
          if current.next_list_item
            string += ', '
            current = current.next_list_item
          end
        end
      string += ' |'
      string
    else
      '| |'
    end
  end

end