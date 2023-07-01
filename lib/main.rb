# frozen_string_literal: true

require_relative 'linked_list'
require 'pp'

puts 'Linked List Initialized'

list = LinkedList.new

# inserting at end
list.append(1)
list.append(2)
list.append(3)

# inserting at beginning
list.prepend(0)

# return size of linked list
# puts list.size

# return the first node 
# puts list.head

# return the last node 
# puts list.tail

# return node at index position
# puts list.at(3)

# delete the last node
# p list.pop

# check if value is present
# p list.contains(0)

# return the index of node at which given value is present
# p list.find(3)

# represent list objects as strings
# puts list.to_s