//
//  Deuque with Linked List.swift
//  
//
//  Created by Michael Fulton Jr. on 3/15/17.
//
//

import Foundation

class Node<T> {
    public var item: T!
    public var next: Node<T>?
    public var previous: Node<T>?
}

class Deque <T> {
    private var frontNode: Node<T>?
    private var backNode: Node<T>?
    private var count: Int = 0
    public var size: Int {
        return self.count
    }
    
    // Returns true if Deque is empty
    public var isEmpty: Bool {
        return self.count == 0
    }
    
    
    public init(_ items: T..., enqueueBack: Bool = true){
        if enqueueBack {
            self.enqueueBack(items)
        } else {
            self.enqueueFront(items)
        }
    }
    
    public init(_ items: [T], enequeBack: Bool = true) {
        if enequeBack {
            self.enqueueBack(items)
        } else {
            self.enqueueFront(items)
        }
    }
    
    // Adds a Node to the back of the Deque
    public func enqueueBack(_ item: T){
        let newNode: Node<T> = Node()
        newNode.item = item
        if frontNode == nil {
            frontNode = newNode
            backNode = frontNode
        } else {
            newNode.previous = backNode
            backNode!.next = newNode
            backNode = newNode
        }
        self.count += 1
    }
    
    public func enqueueBack(_ items: T...) {
        _ = items.map { self.enqueueBack($0) }
    }
    
    public func enqueueBack(_ items: [T]) {
        _ = items.map { self.enqueueBack($0) }
    }
    
    // Adds a Node to the front of the Deque
    public func enqueueFront(_ item: T) {
        let newNode: Node<T> = Node()
        newNode.item = item
        if frontNode == nil {
            frontNode = newNode
            backNode = newNode
        } else {
            frontNode!.previous = newNode
            newNode.next = frontNode
            frontNode = newNode
        }
        self.count += 1
    }
    
    public func enqueueFront(_ items: T...) {
        
        _ = items.map { self.enqueueFront($0)}
    }
    
    public func enqueueFront(_ items: [T]) {
        _ = items.map { self.enqueueFront($0)}
    }
    
    // Removes a Node from the front of the Deque and returns its value
    public func dequeueFront() -> T? {
        if self.frontNode != nil {
            let tempNode = self.frontNode
            self.frontNode = tempNode!.next
            if frontNode != nil {
                self.frontNode!.previous = nil
            }
            self.count -= 1
            return tempNode!.item
        }
        self.backNode = nil
        return nil
    }
    
    // Removes all Nodes from the Deque and returns an array of values
    // Takes in a Boolean to determine if to dequeue from back or from
    public func dequeueAll(fromFront: Bool = true) -> [T] {
        var itemArray: [T] = []
        if fromFront {
            while self.frontNode != nil {
                itemArray.append(self.dequeueFront()!)
            }
        } else {
            while self.backNode != nil {
                itemArray.append(self.dequeueBack()!)
            }
        }
        return itemArray
    }
    
    // Removes a specified amount of Nodes from the
    // front of the Deque and reutrns an array of their values
    public func dequeueFront(_ amount: Int) -> [T] {
        var itemArray: [T] = []
        if (0...self.count).contains(amount) {
            for _ in 0..<amount {
                itemArray.append(self.dequeueFront()!)
            }
        }
        return itemArray
    }
    
    // Removes a Node from the back of the Deque and returns its value
    public func dequeueBack() -> T? {
        if self.backNode != nil {
            let tempNode = self.backNode
            self.backNode = tempNode!.previous
            if self.backNode != nil {
                self.backNode!.next = nil
            }
            self.count -= 1
            return tempNode?.item
        }
        self.frontNode = nil
        return nil
    }
    
    // Removes a specified amount of Nodes from the
    // front of the Deque and reutrns an array of their values
    public func dequeueBack(_ amount: Int) -> [T] {
        var itemArray: [T] = []
        if (0...self.count).contains(amount){
            for _ in 0..<amount {
                itemArray.append(dequeueBack()!)
            }
        }
        return itemArray
    }
    
    // Removes all Nodes from the Queue
    public func empty() {
        self.frontNode = nil
        self.backNode = nil
    }
}
