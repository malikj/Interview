//
//  ViewController.swift
//  ArrayInDetail
//
//  Created by malikj on 07/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let arrayWithRepeat = Array(repeating: "malik", count: 5)
//        print(arrayWithRepeat)
//        createMultiDimenionalArray()
//
//        let missingValuesArray = [1,2,3,4,6];
//        let missingNumber = findMissingNumber(missingValuesArray);
//        print(missingNumber)
        // Input: {0, 1, 2, 6, 9}, n = 5, m = 10
//        let missingValuesArrayTwo = [4, 5, 6, 7, 9,10];
        //        let missingValuesArrayTwo = [4, 5, 6, 7, 19,20];

//        findMissingNumberSorted(missingValuesArrayTwo)
        
//        let missingValuesArrayTwo = [2, 3, -7, 6, 8, 1, -10, 15];
//
//        findMissingNumberUnsorted(missingValuesArrayTwo)
//
//        let dupValuesArrayTwo = [1, 2, 3, 1];
//
//        findDuplicates(dupValuesArrayTwo)
        
//        duplicates1()
        
//        searchElementInArray()
        
//        printPairsUsingSet()
        
//        findCommonElementsInTwoArray()
//        findCommonElementsInTwoArrayWithHashing()
//        findCommonWithWhileLoop()
        
        calcaulateDiff()
    }
    
    // MARK :- Array 2D
    // https://github.com/raywenderlich/swift-algorithm-club/tree/master/Array2D
    
    func  createMultiDimenionalArray() {
        var cookies = [[Int]]()
        for _ in 1...9 {
            var row = [Int]()
            for _ in 1...7 {
                row.append(0)
            }
            cookies.append(row)
        }
        
        print(cookies)
        var chocklets = [[Int]]()
        for _ in 1...9 {
            var row = [Int]()
            for _ in 1...7 {
                row.append(0)
            }
            chocklets.append(row)
        }
        
    }
    
    // 1. Find the missing number in integer array of 1 to 100? (solution)
    
    // MARK : - Missing number
    
    func findMissingNumber(_ valueArray:[Int]) -> Int {
        
//        (n+1)*(n+2)/2 - gives total  expected  sum
        let expectedSum  = (valueArray.count+1)*(valueArray.count+2)/2;

        var actualSum = 0
        for i in valueArray {
            actualSum += i
        }
        return expectedSum - actualSum

    }
    
    // Find the smallest missing number
   // Given a sorted array of n distinct integers where each integer is in the range from 0 to m-1 and m > n. Find the smallest number that is missing from the array.
    
    // Input: {0, 1, 2, 6, 9}, n = 5, m = 10
   //  Output: 3
    
    func findMissingNumberSorted(_ valueArray:[Int]) {
        
//        let missingValuesArrayTwo = [4, 5, 6, 7, 19,20];

        var missing = 0
        var first = 0
        var last = valueArray.count-1
        var middle = (first + last)/2
        while first < last {
            if ((valueArray[middle] - valueArray[first]) != (middle - first)) {
                /* there is a hole in the first half */
                if ((middle - first) == 1 && (valueArray[middle] - valueArray[first] > 1)) {
                    missing = (valueArray[first] + 1);
                    print("missing first half \(missing)")
                    break
                }
                last = middle;
            }
            else if ((valueArray[last] - valueArray[middle]) != (last - middle)) {
                /* there is a hole in the second half */
                if ((last - middle) == 1 && (valueArray[last] - valueArray[middle] > 1)) {
//                    return (valueArray[middle] + 1);
                    missing = (valueArray[middle] + 1);
                    print("missing second half  \(missing)")
                    break
                }
                first = middle;
            }
        else {
            print("no missing")
                break
        }
            middle = (first + last)/2;
        }
    }
    
    // this work find the missing element from array
    // more than one element
    func findMissingNumberSortedTwo(_ valueArray:[Int]) {
        
//        let missingValuesArrayTwo = [0, 1, 2, 6, 7];
        
//        let missingValuesArrayTwo = [4, 7, 9, 16, 19];

        var missing = 0
        for i in 0..<valueArray.count-1 {
            let x = valueArray[i+1]
            let y = valueArray[i] + 1
            if x != y {
                missing = y
                print("missing \(missing)")
                break
            }
        }
    }
    
    // concept
    // Method 2 (Linear Search)
//    If arr[0] is not 0, return 0. Otherwise traverse the input array starting from index 0, and for each pair of elements a[i] and a[i+1], find the difference between them. if the difference is greater than 1 then a[i]+1 is the missing number.
    // O(n)
    func findMissingNumberSortedThree(_ valueArray:[Int]) {
        var missing = 0
        for i in 0..<valueArray.count-1 {
            let x = valueArray[i]
            let y = valueArray[i+1]
            if (x - y) > 1 {
                missing = valueArray[i]+1
                print("missing \(missing)")
                break
            }
        }
    }
    
    func findMissingNumberSortedFour(_ valueArray:[Int]) {

    }
    
//    Find the smallest positive number missing from an unsorted array | Set 1
//    You are given an unsorted array with both positive and negative elements. You have to find the smallest positive number missing from the array in O(n) time using constant extra space. You can modify the original array.
    
    // https://www.geeksforgeeks.org/find-the-smallest-positive-number-missing-from-an-unsorted-array/
    
   //  https://www.geeksforgeeks.org/?p=9755
    
    /*
     traverse the list for i= 0 to n-1 elements
     {
     check for sign of A[abs(A[i])] ;
     if positive then
     make it negative by   A[abs(A[i])]=-A[abs(A[i])];
     else  // i.e., A[abs(A[i])] is negative
     this   element (ith element of list) is a repetition
     }
 */
    func findMissingNumberUnsorted(_ valueArray: [Int]) {
        
//        let missingValuesArrayTwo = [2, 3, 7, 6, 8, -1, -10, 15];

        let segArray =  segregateArray(valueArray)
        
        let miss = findmissingPositive(valueArray, valueArray.count-segArray)
        print(miss)
        
    }
    
    func findmissingPositive(_ arrayVal:[Int], _ negativeSize : Int) -> Int {
        var valueArray = arrayVal
        for i in 0..<negativeSize {
            if abs(valueArray[i]) - 1  < negativeSize {
                if valueArray[abs(valueArray[i]) - 1] > 0 {
                    valueArray[abs(valueArray[i]) - 1] = -valueArray[abs(valueArray[i]) - 1];
                }
            }
            
        }
        for j in 0..<negativeSize {
            if valueArray[j] > 0 {
            print("j+1 \(j+1)")
                return j+1
            }
        }
      return negativeSize+1
        
    }
    
    func segregateArray(_ valueArray : [Int]) -> Int{
        
     //    swapping
//        [2, 3, 7, 6, 8, -1, -10, 15];
        //  [-1, 3, 7, 6, 8, 2, -10, 15];
        var values = valueArray
        var j = 0
        for i in 0..<values.count {
                if values[i] < 0 {
                    values.swapAt(i, j)
                    j = j+1
                }
        }
        return j
    }
    
    // MARK: - Duplicates
    
    func findDuplicates (_ values : [Int]) {
        var valueArray = values
        for i in 0..<valueArray.count {
            if valueArray[abs(valueArray[i])] >= 0 {
                print(" before valueArray \(valueArray[i])");
             valueArray[abs(valueArray[i])] = -valueArray[abs(valueArray[i])];
                print(" after valueArray \(valueArray[i])");
                }
            else {
                print(" duplicte \(abs(valueArray[i]))");
            }
        }
    }
    
    // hasing technique  - This approach may take O(n) time on average, but it requires O(n) extra space.
    func duplicates1()  {
        let intArray = [4, 2, 4, 5, 2, 3, 1]
        var newCounts :[Int:Int] = [:]
        for element in intArray {
            newCounts[element] = (newCounts[element] ?? 0) + 1
        }
        
        print(newCounts);
        
        for (key, value) in newCounts {
            if value>=2 {
                print("\(key) occurs \(value) time(s)")
            }
        }
        
        let arr = ["FOO", "FOO", "BAR", "FOOBAR"]
        let counts = arr.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
        print(counts)  // ["BAR": 1, "FOOBAR": 1, "FOO": 2]
        for (key, value) in counts {
                print("\(key) occurs \(value) time(s)")
        }
        
        
    }
    
    // MARK: - Search
    
    // Check if array contains a number
    
    func searchElementInArray() {
        
        // sorted Array
        let intArray = [22, 23, 33,44]
        
        let elementToSearch = 33
        
        // Binary search : Time Complexity O(logn)
        
        let foundAtIndex = binarySearch(inputArr: intArray, searchItem: elementToSearch)
        let foundAtIndex2 = binarySearchTwo(matrixArray: intArray, low: 0, high: intArray.count-1, key: elementToSearch)
        print("foundAtIndex2 \(foundAtIndex2)")
        
        // hashing

    }
    
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
    
    func binarySearchTwo(matrixArray : [Int],low:Int, high: Int, key :Int) -> Int   {
        var start = low
        var end = high
        while (start <= end) {
            let mid = (start+end)/2
            if matrixArray[mid] <= key {
                start = mid + 1
            }
            else {
                end = mid - 1
            }
        }
        return end
    }
    
//    How to find all pairs on integer array whose sum is equal to given number? (solution)
    
    // Hashing O (n)
    func printPairsUsingSet()  {
        
//       Input  :  arr[] = {1, 5, 7, -1},
        let intArray = [1, 5, 7,-1]
        let sum = 6
    
        if intArray.count > 2 {
            var dic :[Int:Int] = [:]
            for i in intArray {
                let target = sum - i
                print("dic is \(dic)")
                if ((dic[target]) != nil) {
                    print(" i \(i) and target \(target)")
                }
                else {
                    dic[i] = i
                    print("else dic is \(dic)")
                }
            }
        }
    }
    
    
    // MARK: - Common Elements
    
    func findCommonElementsInTwoArray() {
    let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
    let secondArray = [9,400,62,399]
        
//  let mergeArray =  firstArray + secondArray;
    
    let newArray  = firstArray.filter { (string) -> Bool in
    return secondArray.contains(string)
    }
    print (newArray)
    }
    
    // with Hashing
    
    func findCommonElementsInTwoArrayWithHashing() {
        let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
        let secondArray = [9,400,62,399]
        var hash1Array : [Int:Int] = [:]
        for i in firstArray {
            hash1Array[i] = 1
        }
        for j in secondArray {
            if (hash1Array[j] != nil) {
                print("common element is \(j)")
            }
        }
    }
    
    // This will work only for sorted array
   // O(n1 + n2 ) where n1, n2
    func findCommonWithWhileLoop() {
        let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
        let secondArray = [9,400,62,399]
        var i = 0, j = 0
        while i < firstArray.count && j < secondArray.count {
            if (firstArray[i] == secondArray [j]) {
                print("equal elements \(firstArray[i])")
                i = i+1
                j = j+1
            }
            else if (firstArray[i] < secondArray[j]) {
                i = i+1
            }
            else {
                j = j+1
            }
        }
    }
    
    // MARK: - Difference between elements
    
//    A little explanation: subArray = slice(1) gets all but the first element. map returns a new value for each of those, and the value returned is the difference between the element and the corresponding element in A, (the un-sliced array), so A[i] is the element before [i] in the slice.
    

    func flatMapTest () {
        
        let arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]
        let flattenedArray = arrayOfArrays.flatMap { array in
            return array.map { integer in
                return integer * 2
            }
        }
        print(flattenedArray) // outputs: [ 2, 2, 4, 4, 6, 6 ]
    }
    
    func calcaulateDiff () {
        // array with difference
        let firstArray = [59,54,59,60,61]
        let subArray = firstArray[1...firstArray.count-1]
        let indexAndNum = subArray.enumerated().map { (index,element) in
            return element - firstArray[index]
        }
        
        print(indexAndNum)

        
        // which has specific difference

        let diff1 = subArray.enumerated().map { (arg) -> Int in
            let (index, element) = arg
            let diff = element - firstArray[index]
            if diff == 1 {
                return diff
            }
            else {
                return 0
            }
        }
        
        print(diff1)
        
        
        // elements which has 1 difference

        let diff2 = subArray.enumerated().filter { (arg) -> Bool in
            let (index, element) = arg
            return (element - firstArray[index]) == 1
        }
        
        print(diff2)
    
    }
    
}

