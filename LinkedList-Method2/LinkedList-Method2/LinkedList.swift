//
//  LinkedList.swift
//  LinkedList-Method2
//
//  Created by malikj on 18/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

extension MyLinkedList: ExpressibleByArrayLiteral {
    
    public convenience init(arrayLiteral elements: T...) {
        self.init()
        
        var previous: Node? = nil
        
        for element in elements {
            let newNode = Node(element)
            previous?.next = newNode
            
            if head == nil {
                head = newNode
            }
            previous = newNode
        }
    }
}

public final class MyLinkedList<T:Equatable> {
    
    // Node class
    class Node {
        var value : T
        var next : Node?=nil
        init(_ value:T) {
            self.value = value
        }
    }
    var head : Node?
    
    init() {
        self.head  = nil
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
}

extension MyLinkedList {
    
//    func isEmpty() -> Bool? {
//        return self.head == nil
//    }
    
    func last ()  -> Node? {
        var lastNode = self.head
        while lastNode?.next != nil {
            lastNode = lastNode?.next!
        }
        return lastNode
    }
    
    func printAllKeys() {
        var current: Node! = head
        print("---------------")
        while current != nil {
            print("The item is \(current.value)")
            current = current.next
        }
    }
    
    // MARK: - Remove duplicates
    
    func removeDuplicates<T: Hashable>( _ linkedList:MyLinkedList<T>) {
        var currentNode = linkedList.head
        var previousNode : MyLinkedList<T>.Node? = nil
        var founds: Set<T> = []
        while currentNode != nil {
            let val = currentNode?.value
            if founds.contains(val!) {
                previousNode?.next = currentNode?.next
            }
            else {
                founds.insert(val!)
                previousNode = currentNode
            }
            currentNode = currentNode?.next
        }
    }
    
    /// Complexity: O(n^2) time and O(1) space
    public func removeDups2<T>(_ list: MyLinkedList<T>) {
        var node = list.head
        
        while node != nil {
            var runner = node?.next
            
            var previous = node
            while runner != nil {
                if runner?.value == node!.value {
                    previous?.next = runner?.next
                } else {
                    previous = runner
                }
                runner = runner?.next
            }
            
            node = node?.next
        }
    }
    
    
    // MARK: - Reverse

    public func reverse() {
        if (head == nil) { return }
        if (head?.next == nil) { return }
        
        var node = head
        var next: MyLinkedList<T>.Node? = nil
        var previous: MyLinkedList<T>.Node? = nil

        while (node != nil) {
            head = node
            next = node?.next
            node?.next = previous
            previous = node
            node = next
        }
    }
    
    func printNthFromLast(indexVal:Int) {
        var lengthOfTheLinkedList : Int  = 0
        var head = self.head
        while head?.value != nil {
            lengthOfTheLinkedList = lengthOfTheLinkedList + 1
            head = head?.next
        }
        if lengthOfTheLinkedList < indexVal {
            print("out of index")
            return
        }
        var temp = self.head
        let endIndex = lengthOfTheLinkedList - (indexVal - 1)
        for _ in 1..<endIndex {
            temp = temp?.next
        }
        print(temp?.value ?? "no value")
    }
    
    /// Complexity: O(n) space, O(1) time
    public func kthToLast<T>(_ k: Int, _ list: MyLinkedList<T>) -> T? {
        guard k > 0 else { return nil }
        
        var runner1 = list.head
        var runner2: MyLinkedList<T>.Node? = nil
        var index = 0
        
        while runner1?.next != nil {
            index += 1
            
            if k == index {
                runner2 = list.head
            }
            
            runner1 = runner1?.next
            runner2 = runner2?.next
        }
        
        return runner2?.value
    }
    
    func printKthToLast(head:Node?, k:Int) -> Int {
      if (head == nil) { return 0 }
        print("before recursvion call")
        let index = printKthToLast(head: head?.next, k: k) + 1
        print("index \(index)")
       if (index == k) {
        print ("kth last element is \(String(describing: head?.value))")
       }
     return index;
    }
    
    func deleteNode (node:Node?)  {
        let deleteNode = node
        let deleteNextNode = node?.next
        deleteNode?.value = (deleteNextNode?.value)!
        deleteNode?.next = deleteNextNode?.next
        printAllKeys()
    }
    
    func detectloop<T>( _ list : MyLinkedList<T>) -> Bool {
        guard !list.isEmpty else { return false}
        
        var slowRunner = list.head
        var fastRunner = list.head
        
        repeat {
            fastRunner = fastRunner?.next?.next
            slowRunner = slowRunner?.next
            
            // !== and === are identity operators and are used to determine if two objects have the same reference.
            
            if (slowRunner === fastRunner) {
                return true
            }
            
        } while (slowRunner != nil && fastRunner != nil)
        
        return false
    }
}



