//
//  ViewController.swift
//  LinkedList-Method2
//
//  Created by malikj on 18/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        testRemoveDuplicates()
        testKthNode()
        testDeleteNode()
    }

    func testRemoveDuplicates () {
        let newList1 : MyLinkedList<Int> = [1,1,2,2,3,3,4,5]
        newList1.printAllKeys()
        newList1.removeDuplicates(newList1)
        newList1.printAllKeys()
        
    }
    
    func testKthNode () {
        let newList1 : MyLinkedList<Int> = [100,200,300]
        newList1.printNthFromLast(indexVal: 2)
        newList1.printKthToLast(head: newList1.head!, k: 2)
    }
    
    func testDeleteNode () {
        let newList1 : MyLinkedList<Int> = [100,200,300,400, 500]
        newList1.deleteNode(node: newList1.head?.next?.next)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

