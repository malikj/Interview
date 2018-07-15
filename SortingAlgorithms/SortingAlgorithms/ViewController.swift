//
//  ViewController.swift
//  SortingAlgorithms
//
//  Created by malikj on 15/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- BubbleSort
    
    func bubbleSort() {
        var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]
        let n = numberList.count;
        for i in 0..<n-1 {
            for j in 0..<n-i-1 {
                if (numberList[j]>numberList[j+1]) {
                    let temp = numberList[j]
                    numberList[j] = numberList[j+1]
                    numberList[j+1] =  temp;
                }
            }
        }
    }
    
    // MARK: - InsertionSort
    
    func insertionSort(a: [Int]) -> [Int] {
        guard a.count > 1 else { return a }
        var b = a
        for i in 1..<b.count {
            var y = i
            let temp = b[y]
            while y > 0 && temp < b[y - 1] {
                b[y] = b[y - 1]
                y -= 1
            }
            b[y] = temp
        }
        return b
    }
    
    // MARK: - BinarySearch
    
    
    func binarySearch<T:Comparable>(inputArr:Array<T>, searchItem: T) -> Int? {
        var lowerIndex = 0;
        var upperIndex = inputArr.count - 1
        while (true) {
            let currentIndex = (lowerIndex + upperIndex)/2
            if(inputArr[currentIndex] == searchItem) {
                return currentIndex
            } else if (lowerIndex > upperIndex) {
                return nil
            } else {
                if (inputArr[currentIndex] > searchItem) {
                    upperIndex = currentIndex - 1
                } else {
                    lowerIndex = currentIndex + 1
                }
            }
        }
    }
    
    // MARK: - MergeSort
    
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [T] = []
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        return orderedArray
    }
    
    // MARK: - QuickSort
    
    func quickSortOne(array: [Int]) -> [Int] {
        if array.isEmpty { return [] } // 1
        let first = array.first! // 2
        let smallerOrEqual = array.dropFirst().filter { $0 <= first } // 3
        let larger         = array.dropFirst().filter { $0 > first } // 4
        return quickSortOne(array: smallerOrEqual) + [first] + quickSortOne(array: larger) // 5
    }
    
    func quickSortTwo<T: Comparable>(array: [T]) -> [T] {
        guard !array.isEmpty else { return [] }
        let pivot = array.first!
        let arrayLessThanOrEqualToPivot = array.dropFirst().filter { $0 <= pivot }
        let arrayGreaterThanOrEqualToPivot = array.dropFirst().filter { $0 > pivot }
        return quickSortTwo(array: arrayLessThanOrEqualToPivot) + [pivot] + quickSortTwo(array: arrayGreaterThanOrEqualToPivot)
    }
}

