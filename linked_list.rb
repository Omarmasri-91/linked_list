class LinkedList
    attr_accessor :name, :head, :tail, :size
    def initialize(name)
        @name=name
        @head=nil
        @tail=nil
        @size=0
    end
    def append(value)
        node=Node.new(value)
        if @size == 0
            @head=node
        elsif @size == 1
            @head.next_node=node
            @tail=node
        else
            @tail.next_node=node
            @tail=node
        end
        @size+=1
    end
    def prepend(value)
        node=Node.new(value)
        if @size == 0
            @head=node
        elsif @size == 1
            node.next_node=@head
            @tail=@head
            @head=node
        else
            node.next_node=@head
            @head=node
        end
        @size+=1
    end
    def at(index)
        if index < @size
            puts "The node at index #{index} is:"
            temp_node=@head
            if index < @size && @size > 0
                index.times do |node|
                    temp_node=temp_node.next_node
                end
            else
                temp_node=nil
            end
            puts temp_node
            return temp_node
        else
            puts "The last index in this list is #{@size-1}"
            return nil
        end
    end
    def pop
        if @tail!= nil
            @size-=1
            @tail=at(@size-1)
            @tail.next_node=nil
        elsif @head != nil
            @size-=1
            @head=nil
        else
            puts "There are no nodes in this list"
        end
    end
    def contains?(value)
        temp_node=@head
        (@size).times do 
            return true if temp_node.value == value
            temp_node=temp_node.next_node
        end
        false
    end
    def find(value)
        index=0
        if @size > 0
            temp_node=@head
            while temp_node!=nil
                return index if temp_node.value==value
                temp_node=temp_node.next_node
                index+=1
            end
        end
        nil
    end
    def to_s
        temp_node=@head
        (@size).times do
            print "(#{temp_node.value}) ->"
            temp_node=temp_node.next_node
        end
        print "nil"
    end
    def insert_at(value, index)
        if index == @size-1
            append(value)
            @size+=1
        elsif index < @size
            new_node=Node.new(value)
            next_node=at(index)
            new_node.next_node=next_node
            previous_node=at(index-1)
            previous_node.next_node=new_node
            @size+=1
        else
            puts "Max index to use is #{@size}"
        end
    end
    def remove_at(index)
        if index < @size
            remove_node=at(index)
            prev_node=at(index-1)
            next_node=at(index+1)
            prev_node.next_node=next_node
            @size-=1
        else
            puts "the list's last index is #{@size-1}"
        end
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value=nil, next_node=nil)
        @value=value
        @next_node=next_node
    end
end