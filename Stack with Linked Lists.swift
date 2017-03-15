//
//  Stack with Linked Lists.swift
//
//
//  Created by Michael Fulton Jr. on 3/14/17.
//
//

import Foundation

class Node<T> {
    public var item: T!
    public var next: Node<T>?
}

class Stack<T> {
    private var topNode: Node<T>?
    private var count: Int = 0
    public var size: Int {
        return self.count
    }
    
    
    public init(_ items: T...) {
        items.forEach { item in self.push(item)}
    }
    
    public init(_ items: [T]) {
        items.forEach { item in self.push(item)}
    }
    
    
    // Returns the item at the Top of the stack
    public var top: T? {
        if topNode != nil {
            return topNode!.item ?? nil
        }
        return nil
        
    }
    
    // Returns true if stack is empty
    public var isEmpty: Bool {
        return count == 0
    }
    
    // Adds new item at the top of the stack
    public func push(_ item: T){
        let newNode: Node<T> = Node()
        newNode.item = item
        newNode.next = self.topNode
        self.topNode = newNode
        self.count += 1
    }
    
    public func push(_ items: T...){
        items.forEach { item in self.push(item)}
    }
    
    public func push(_ items: [T]) {
        items.forEach { item in self.push(item)}
    }
    
    // Pops an item from the top of the stack
    public func pop() -> T? {
        if let temp = topNode {
            topNode = temp.next
            self.count -= 1
            return temp.item
            
        }
        return nil
    }
    
    // Pops a specified amount of items from the stack
    public func pop(by: Int) -> [T]? {
        let range = (0...self.count)
        if range.contains(by) {
            let newRange = (0...by-1).clamped(to:range)
            return newRange.map { _ in self.pop()! }
        }
        return nil
    }
    
    // Pops all items from the stack ad returns them in an array
    public func popAll() -> [T] {
        var itemArray:[T] = []
        while self.topNode != nil {
            itemArray.append(self.pop()!)
        }
        return itemArray
    }
    
    // Removes all items from the stack
    public func removeAll() {
        self.topNode = nil
        self.count = 0
    }
}
