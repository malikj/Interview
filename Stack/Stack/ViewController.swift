//
//  ViewController.swift
//  Stack
//
//  Created by malikj on 17/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

class Stack<T> {
    
    private var array = [T]()
    
    func push (_ element :T) {
        array.append(element)
    }
    
    func pop () -> T? {
        return array.popLast()
    }
    
    func top () ->T? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
     var count: Int {
        return array.count
    }
    
    func returnAllValues ()-> [T] {
        return array
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // LIFO -
        // push
//        Notice that a push operation puts the new element at the end of the array, not the beginning. Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory. Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.
        
       // pop
//        The Swift array has a handy method for removing it’s last element. popLast does just that.

        let stack = Stack<Int>()
        stack.push(123)
        stack.push(321)
        stack.push(121)
        print(stack.returnAllValues())
        print("pop \(stack.pop())")
        print(stack.returnAllValues())
        print("top \(stack.top())")

// https://www.codeproject.com/Tips/1175562/Check-for-Balanced-Parenthesis-in-a-String
        
        // paranthesis check
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

