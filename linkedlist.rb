class LinkedList
    attr_accessor :head, :tail

    def initialize(value = nil)
        node = Node.new(value)
        @head = node
        @tail = node
    end

    def prepend(value)
        node = Node.new(value, @head)
        @head = node
    end

    def append(value)
        node = @head
        node = node.next until node.next.nil?
        node.next = Node.new(value)
        @tail = node.next
    end

    def size
        size = 1
        node = @head
        until node.next.nil?
            node = node.next
            size += 1
        end
        size
    end

    def head
        @head.value
    end

    def tail
        @tail.value
    end

    def at(index)
        current = 0
        node = @head
        until current == index
            node = node.next 
            current += 1
        end
        return "Nothing found" if node.nil?
        node.value
    end

    def pop
        node = @head
        node = node.next until node.next == @tail
        node.next = nil
        @tail = node
    end

    def contains?(value)
        node = @head
        until node.value == value
            node = node.next
            return false if node.nil?
        end
        true
    end

    def find(value)
        index = 0
        node = @head
        until node.value == value
            node = node.next 
            index += 1
        end
        return nil if node.nil?
        index
    end

    def to_s
        node = @head
        string = ""
        until node.nil?
            string += "( #{node.value} ) -> "
            node = node.next
        end
        string += "nil\n" if node.nil?
        string
    end

    def insert_at(value, index)
        current = 0
        node = @head
        until current == index-1
            node = node.next 
            current += 1
        end
        new_node = Node.new(value, node.next)
        node.next = new_node
    end

    def remove_at(index)
        current = 0
        node = @head
        until current == index-1
            node = node.next 
            current += 1
        end
        new_next = node.next
        node.next = new_next.next
    end

    class Node
        attr_accessor :value, :next
        def initialize(data = nil, next_value = nil)
            @value = data
            @next = next_value
        end
    end

end



list = LinkedList.new('Linked')
puts list
list.append('Goodbye')
puts list
list.prepend('Hello')
puts list
puts "list contains #{list.size} elements"
puts "the first element is #{list.head}"
puts "the last element is #{list.tail}"
puts "the element at index 1 is #{list.at(1)}"
puts list.to_s
list.pop
puts "list contains #{list.size} elements"
puts "the last element is #{list.tail}"
puts "the element at index 2 is #{list.at(2)}"
puts list.contains?('Goodbye')
puts list.find('Linked')
puts list.to_s
list.insert_at('ayee',1)
puts list.to_s
list.remove_at(1)
puts list.to_s
