//
//  ViewController.swift
//  Tree
//
//  Created by malikj on 15/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

extension TreeNode where G: Equatable {
    func search(_ value: G) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

public class TreeNode<G> {
    public var value: G
    
    public weak var parent: TreeNode?
    public var children = [TreeNode<G>]()
    
    public init(value: G) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<G>) {
        children.append(node)
        node.parent = self
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tree = TreeNode<String>(value: "beverages")
        
        let hotNode = TreeNode<String>(value: "hot")
        let coldNode = TreeNode<String>(value: "cold")
        
        tree.addChild(hotNode)
        tree.addChild(coldNode)
        print(hotNode.parent)
        print(coldNode.parent!.children)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

