//
//  Stack with Array.swift
//
//
//  Created by Michael Fulton Jr. on 3/14/17.
//
//

import Foundation

public struct Stack<T> {
    private var itemArray: [T] = []
    
    // Returns the item at the Top of the stack
    public var top: T? {
        return itemArray.last
    }
    public var size: Int {
        return self.itemArray.count
    }
    
    // Returns true if stack is empty
    public var isEmpty: Bool {
        return self.itemArray.isEmpty
    }
    
    public init(_ items: T...) {
        self.itemArray = items
    }
    
    public init(_ items: [T]) {
        self.itemArray = items
    }
    
    // Adds new item at the top of the stack
    public mutating func push(_ item: T) {
        self.itemArray.append(item)
    }
    
    public mutating func push(_ items: T...) {
        self.itemArray = items.map { $0 }
    }
    
    public mutating func push(_ items: [T]) {
        self.itemArray = items
    }
    
    // Pops an item from the top of the stack
    public mutating func pop() -> T? {
        return self.itemArray.popLast()
    }
    
    // Pops a specified amount of items from the stack
    public mutating func pop(by: Int) -> [T] {
        var temp: [T] = []
        if by < self.itemArray.count {
            for _ in 0..<by {
                temp.append(self.pop()!)
            }
        }
        return temp
    }
    
    // Pops all items from the stack ad returns them in an array
    public mutating func popAll() -> [T] {
        var temp: [T] = []
        for _ in self.itemArray {
            temp.append(self.pop()!)
        }
        return temp
    }
    
    // Removes all items from the stack
    public mutating func removeAll() {
        self.itemArray.removeAll()
    }
}


