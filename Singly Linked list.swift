//
//  Singly Linked list.swift
//
//
//  Created by Michael Fulton Jr. on 3/14/17.
//
//

import Foundation


class Node<T> {
    var item: T!
    var next: Node<T>?
}

// Singly Linked List
class LinkedList<T: Equatable> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: Int = 0
    
    // Returns the number of Nodes in the list
    public var size: Int {
        return self.count
    }
    
    // Returns true if the list is empty
    public var isEmpty: Bool {
        return self.count == 0
    }
    
    // Returns the value of a Node at a given index
    public func valueAtIndex(_ index: Int) -> T? {
        if (0..<self.count).contains(index) {
            var currentIndex = 0
            var currentNode: Node<T>? = head
            if currentNode != nil {
                while currentIndex != index {
                    
                    currentNode = currentNode!.next
                    currentIndex += 1
                }
                if currentIndex == index {
                    return currentNode!.item
                }
                
            }
        }
        return nil
    }
    
    // Adds a Node to the begining of the list
    public func pushFront(_ item: T) {
        let temp: Node<T>? = self.head
        let newNode: Node<T> = Node()
        newNode.item = item
        newNode.next = temp
        self.head = newNode
        self.count += 1
        
        if self.tail == nil {
            self.tail = head
        }
        
    }
    
    // Removes Node from front of list and return its value
    public func popFront() -> T? {
        
        if let temp: Node<T> = self.head {
            self.head = temp.next
            self.count -= 1
            if self.count == 0{
                self.tail = nil
            }
            return temp.item
        }
        if self.head == nil {
            self.tail = nil
        }
        return nil
    }
    
    // Add Node to end of the list
    public func pushBack(_ item: T) {
        let newNode: Node<T> = Node()
        newNode.item = item
        newNode.next = nil
        
        if self.tail == nil {
            
            self.head = newNode
            self.tail = self.head
            
        } else {
            self.tail!.next = newNode
            self.tail = self.tail!.next
            
        }
        self.count += 1
    }
    
    // Remove a Node from the back of the list and return its value
    public func popBack() -> T? {
        if tail != nil {
            var currentNode: Node<T>? = self.head
            var currentIndex: Int = 1
            while currentNode != nil {
                if self.count == 1 {
                    let item = currentNode?.item
                    self.head = nil
                    self.tail = nil
                    self.count -= 1
                    return item
                }
                if currentIndex == self.count - 1 {
                    let temp = currentNode?.next
                    currentNode?.next = nil
                    self.tail = currentNode
                    self.count -= 1
                    return temp?.item
                }
                currentNode = currentNode!.next
                currentIndex += 1
                
                
            }
            
        }
        
        return nil
    }
    
    // Returns the first Node in the list
    public var front: T? {
        if self.head != nil {
            return self.head!.item
        }
        return nil
    }
    
    // Returns the last Node in the list
    public var back: T? {
        if self.tail != nil {
            return self.tail!.item
        }
        return nil
    }
    
    // Insert a Node with a given value at a given index
    public func insert(_ item: T, at index: Int) {
        
        if (0..<self.count).contains(index) {
            var currentIndex: Int = 0
            var currentNode: Node<T>? = self.head
            let newNode: Node<T> = Node()
            newNode.item = item
            
            if index == 0 {
                let temp = currentNode
                newNode.next = temp
                self.head = newNode
            } else {
                while currentIndex != index - 1 {
                    currentNode = currentNode?.next
                    currentIndex += 1
                }
                newNode.next = currentNode?.next
                currentNode?.next = newNode
            }
            
            self.count += 1
            
        } else {
            if index >= self.count {
                
                self.pushBack(item)
                
            } else {
                self.pushFront(item)
                
            }
        }
        
        
    }
    
    // Erase a Node at a given index
    public func eraseAtIndex(_ index: Int) {
        if (0..<self.count).contains(index) {
            var currentIndex: Int = 0
            var currentNode: Node<T>? = self.head
            if currentNode != nil {
                while currentIndex < index - 1 {
                    currentNode = currentNode?.next
                    currentIndex += 1
                }
                if index == 0 {
                    self.head = currentNode!.next
                } else if index == self.count - 1{
                    currentNode!.next = nil
                    self.tail = currentNode
                } else {
                    currentNode!.next = currentNode?.next!.next
                }
                self.count -= 1
            }
        }
        
    }
    
    // Returns an array of values from Nodes in a given range
    public func valuesInRange( _ range: Range<Int>) -> [T] {
        
        let newRange = range.clamped(to: 0..<self.count)
        var valueArray: [T] = []
        
        var currentIndex: Int = 0
        var currentNode: Node<T>? = self.head
        if currentNode != nil {
            while currentIndex <= newRange.upperBound  {
                if (range).contains(currentIndex) {
                    valueArray.append(currentNode!.item)
                    if currentIndex == newRange.upperBound {
                        break
                    }
                }
                currentNode = currentNode!.next
                currentIndex += 1
            }
        }
        return valueArray
    }
    
    // Reverses the order of the list
    public func reverse() {
        
        var holdingArray: [T] = []
        var currentNode: Node<T>? = self.head
        while currentNode != nil {
            holdingArray.append(currentNode!.item)
            _ = self.popFront()
            currentNode = currentNode!.next
        }
        
        _ = holdingArray.map { self.pushFront($0) }
        
    }
    
    // Removes the first Node in the list with a given value
    public func removeValue(value: T) {
        var currentNode: Node<T>? = self.head
        var previousNode: Node<T>?
        while currentNode != nil {
            
            if currentNode?.item == value  {
                if previousNode != nil {
                    previousNode!.next = currentNode!.next
                    
                } else {
                    self.head = currentNode!.next
                }
                self.count -= 1
                return
            }
            
            previousNode = currentNode!
            currentNode = currentNode!.next
            
        }
        
    }
    
    // Returns an Array of values in the list
    public func returnAll() -> [T] {
        
        var currentNode: Node<T>? = self.head
        var holdingArray: [T] = []
        while currentNode != nil {
            holdingArray.append(currentNode!.item)
            currentNode = currentNode!.next
        }
        return holdingArray
    }
}
