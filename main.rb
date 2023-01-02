class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append_value(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            @tail.next_node = Node.new(value)
            @tail = @tail.next_node
        end
    end

    def prepend_value(value)
        if @head == nil
            @head = Node.new(value)
            @tail = @head
        else
            current_head = Node.new(value)
            current_head.next_node = @head
            @head = current_head
        end
    end

    def size
        value = 0
        if @head == nil
            value
        else
            current_node = @head
            while current_node.next_node != nil 
                current_node = current_node.next_node
                value += 1
            end
            puts (value + 1)
        end
    end

    def head
        if @head == nil
            puts "Empty list"
        else
            puts @head.value
        end
    end

    def tail
        if @head == nil
            puts "Empty list"
        else
            puts @tail.value
        end
    end

    def at(index)
        current_node = @head
        (index - 1).times do
            current_node = current_node.next_node
        end
        puts current_node.value
    end

    def pop
        current_node = @head
        while current_node.next_node.next_node != nil
            current_node = current_node.next_node
        end
        puts current_node.value
        @tail = current_node
        current_node.next_node = nil
    end 

    def contains?(value)
        current_node = @head
        while current_node.value != value && current_node.next_node != nil
            current_node = current_node.next_node
        end
        puts current_node.value == value        
    end

    def find(value)
        index = 0
        current_node = @head
        while current_node.value != value && current_node.next_node != nil
            index += 1
            current_node = current_node.next_node
        end
        if current_node.value == value
            puts index
        else
            puts nil
        end
    end

    def to_s
        current_node = @head
        string = ""
        while current_node.next_node != nil
            string.concat("(#{current_node.value}) => ")
            current_node = current_node.next_node
        end
        puts string.concat("(#{current_node.value}) => nil")
    end
end

class Node
    attr_accessor :next_node, :value, :head, :tail

    def initialize(value)
        @value = value
        @next_node = nil
    end

end

linked_list = LinkedList.new
linked_list.append_value(10)
linked_list.append_value(5)
linked_list.append_value(12)
linked_list.append_value(1)
p linked_list
linked_list.to_s

