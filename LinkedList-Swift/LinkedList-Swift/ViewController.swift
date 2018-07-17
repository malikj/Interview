//
//  ViewController.swift
//  LinkedList-Swift
//
//  Created by malikj on 16/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit



class Dog: Hashable {
    
    var hashValue: Int {
        return uid.hashValue
    }
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    var uid: Int
    var name: String
    var age: Int
    init(uid: Int, name: String, age: Int) {
        self.uid = uid
        self.name = name
        self.age = age
    }
}

class Node<T:Equatable> {
    var value : T? = nil
    var next : Node? = nil
    var insst : Int? = nil
}

class LinkedList<T: Equatable> {
    
    var head : Node<T>? = Node<T>()
    
    func isEmpty() -> Bool {
        return self.head?.value == nil
    }
    
    func first () ->Node<T>? {
        return self.head
    }
    
    func last ()  -> Node<T>? {
        var lastNode = self.head
        while lastNode?.next != nil {
            lastNode = lastNode?.next!
        }
        return lastNode
    }
    
    func insert(value:T){
        //find to see if empty list
        if self.head?.value == nil {
            self.head?.value = value
        }
        else {
            //find the last node without a next value
            var lastNode = self.head
            while lastNode?.next != nil {
                lastNode = lastNode?.next!
            }
            //once found, create a new node and connect the linked list
            let newNode = Node<T>()
            newNode.value = value
            lastNode?.next = newNode
        }
    }
    
    func remove(value: T) {
        //Check if the value is at the head
        if self.head?.value == value {
            self.head = self.head?.next
        }
        //Traverse the linked list to see if node is in the linked list
        if self.head?.value != nil {
            var node = self.head
            var previousNode = Node<T>()
            //If value found, exit the loop
            while node?.value != value && node?.next != nil {
                previousNode = node!
                node = node?.next!
            }
            //once found, connect the previous node to the current node's next
            if node?.value == value {
                if node?.next != nil {
                    previousNode.next = node?.next
                } else {
                    //if at the end, the next is nil
                    previousNode.next = nil
                }
            }
        }
    }
    
    func printAllKeys() {
        var current: Node! = self.head
        print("---------------")
        while current != nil && current.value != nil {
            print("The item is \(current.value!)")
            current = current.next
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
    
    func reverseLinkedList () {
        var current = self.head
        var previous : Node<T>? = nil
        var next : Node<T>? = nil
        while current != nil {
            next = current?.next
            // Reverse current node's pointer
            current?.next = previous
            // Move pointers one position ahead.
            previous = current
            current = next
        }
        current = previous
        
        // print new elements
        var currentTwo: Node! = current
        print("---------------")
        while currentTwo != nil && currentTwo.value != nil {
            print("The item is \(currentTwo.value!)")
            currentTwo = currentTwo.next
        }
    }
    
    func removeDuplicates(){
        
    }
    
    func deleteMid () {
        var slowPointer = self.head
        var fastPointer = self.head
        var previousPointer : Node<T>? = nil
        if self.head != nil{
            while fastPointer != nil && fastPointer?.next != nil {
                fastPointer = fastPointer?.next?.next
                previousPointer = slowPointer
                slowPointer = slowPointer?.next
            }
            previousPointer?.next = slowPointer?.next
            slowPointer = nil
        }
        
        // print new elements
        var currentTwo: Node! = self.head
        print("---------------")
        while currentTwo != nil && currentTwo.value != nil {
            print("The item is \(currentTwo.value!)")
            currentTwo = currentTwo.next
        }
        
    }

    
    func printMid () {
        var slowPointer = self.head
        var fastPointer = self.head
        if self.head != nil{
            while fastPointer != nil && fastPointer?.next != nil {
                fastPointer = fastPointer?.next?.next
                slowPointer = slowPointer?.next
            }
            print("the middle element is \(String(describing: slowPointer?.value))")
        }
    }
    
    func whoseSumEqualTo() {
        
    }
    
    func linkedListPolindrome() {
        var characters = [Character]()
        while self.head != nil {
           characters.append(self.head?.value as! Character)
           self.head = self.head?.next
        }
        print(characters)
        if (isStringPolindrom(str: characters)) {
            print("polindrome string")
        }
        else {
            print("not polindrome string")
        }
    }
    
    func isStringPolindrom(str: [Character]) -> Bool {
        for i in 0..<str.count/2 {
            if (str[i] != str[str.count - i - 1]) {
                return false
            }
        }
        return true
    }
    
    func newNode(value:Int) -> Node<Int> {
        let newmnode = Node<Int>()
        newmnode.value = value
        newmnode.next = nil
        return newmnode
    }
    
    func creatLoopList () {
        
        let head :Node<Int> = newNode(value: 50)
        head.next = newNode(value: 20)
        head.next?.next = newNode(value: 15)
        head.next?.next?.next = newNode(value: 4)
        head.next?.next?.next?.next = newNode(value: 10)
        head.next?.next?.next?.next?.next = head.next?.next
        
//        50 20 15 4 10


    }
    
//    func detectLoop () -> Bool {
//        var slowPointer = self.head
//        var fastPointer = self.head
//        while true {
//            if fastPointer?.next != nil && fastPointer?.next != nil{
//                slowPointer = slowPointer?.next
//                fastPointer = fastPointer?.next?.next
////            }
////            else {
////                return false
////            }
//
////            if(slowPointer == nil || fastPointer == nil) // if either hits null..no loop
////            {
////                return false
////            }
////            if slowPointer == fastPointer {
////                return true
////            }
//        }
//    }
////        return false
//}

    
    func removeLoop () {
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myList = LinkedList<Int>()
        myList.insert(value: 100)
        myList.insert(value: 200)
        myList.insert(value: 300)
        myList.insert(value: 400)
        myList.insert(value: 500)
        myList.insert(value: 600)
        myList.printMid()
        myList.deleteMid()
        myList.printNthFromLast(indexVal: 1)
        myList.remove(value: 100)
        print(myList.first()?.value)
        print(myList.last()?.value)
        myList.printAllKeys()
        print("--reverse list")
        myList.reverseLinkedList()
        
    
        let StringList = LinkedList<Character>()
        StringList.insert(value: "A")
        StringList.insert(value: "B")
        StringList.insert(value: "B")
        StringList.insert(value: "A")
        
    
        StringList.printAllKeys()
//
        StringList.linkedListPolindrome()
        
        let dog1 = Dog(uid: 1, name: "Scrappy", age: 4)
        let dog2 = Dog(uid: 2, name: "Sparky", age: 3)
        let dogArray: [Dog: String] = [
            dog1: "Woff Woff",
            dog2: "Wooooooof!"
        ]
        let dogs: Set<Dog> = [dog1, dog2]
        
        if dog1 == dog2 {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


