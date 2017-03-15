//
//  Standard Queue.swift
//  
//
//  Created by Michael Fulton Jr. on 3/15/17.
//
//

import Foundation

class Node<T> {
    public var item: T!
    public var next: Node<T>?
}

class Queue<T> {
    private var frontNode: Node<T>?
    private var backNode: Node<T>?
    private var count: Int = 0
    public var size: Int {
        return self.count
    }
    
    // Returns true if queue is empty
    public var isEmpty: Bool {
        return self.count == 0
    }
    
    
    public init(_ items: T...){
        _ = items.map { self.enqueue($0) }
    }
    
    public init(_ items: [T]) {
        _ = items.map { self.enqueue($0) }
    }
    
    // Adds a Node to the back of the queue
    public func enqueue (_ item: T){
        let newNode: Node<T> = Node()
        newNode.item = item
        if frontNode == nil {
            frontNode = newNode
            backNode = frontNode
        } else {
            backNode!.next = newNode
            backNode = newNode
        }
        self.count += 1
    }
    
    public func enqueue (_ items: T...) {
        _ = items.map { self.enqueue($0) }
    }
    
    public func enqueue (_ items: [T]) {
        _ = items.map { self.enqueue($0) }
    }
    
    // Removes a Node from the front of the queue and returns its value
    public func dequeue() -> T? {
        if self.frontNode != nil {
            let tempNode = self.frontNode
            self.frontNode = tempNode!.next
            self.count -= 1
            return tempNode!.item
        } else {
            self.backNode = nil
        }
        return nil
    }
    
    // Removes all Nodes from the Queue and returns an array of values
    public func dequeueAll() -> [T] {
        var itemArray: [T] = []
        while self.frontNode != nil {
            itemArray.append(self.dequeue()!)
        }
        return itemArray
    }
    
    // Removes a specified amount of Nodes from the Queue and reutrns an array of their values
    public func dequeue(_ amount: Int) -> [T] {
        var itemArray: [T] = []
        if (0...self.count).contains(amount) {
            for _ in 0..<amount {
                itemArray.append(self.dequeue()!)
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
