class LinkedList
    attr_accessor :name
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
    def size
        puts "The Linked list size is #{@size} nodes"
        return @size
    end
    def head
        puts "The first node in the Linked list is #{@head}"
        return @head
    end
    def tail
        puts "The last node in the Linked list is #{@tail}"
        return @tail
    end
    def at(index)
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
        if @size > 0
            temp_node=@head
            (@size).times do 
                if temp_node.value == value
                    return true
                end
                temp_node=temp_node.next_node
            end
            if temp_node == nil
                return false
            end
        else
            return false
        end
    end
    def find(value)
        index=0
        found="no"
        if @size > 0
            temp_node=@head
            @size.times do 
                if temp_node.value != value
                    temp_node=temp_node.next_node
                    index+=1
                else
                    found="yes"
                    return index
                end
            end
            if found="no"
                return nil
            end
        else
            return nil
        end
    end
    def to_s
        temp_node=@head
        (@size).times do
            print "(#{temp_node.value}) ->"
            temp_node=temp_node.next_node
        end
        print "nil"
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value=nil, next_node=nil)
        @value=value
        @next_node=next_node
    end
end