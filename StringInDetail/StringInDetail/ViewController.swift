//
//  ViewController.swift
//  StringInDetail
//
//  Created by malikj on 15/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//


// Swift Strings
// https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        characterExample()
        prefixSample()
        indexSample()
        insertAndRemove()
        rangeSample()
        rangeOFString()
        
        uniqueCharacter()
        
        let str1 = "dogo"
        
        let str2 = "godO"
        if(isPermutation(str1, str2)) {
            print("permutation yes")
        }
        else {
            print("permutation no")
        }
        
        let urilfy = "Mr John Smith"
        
        print(urlify(urilfy, urilfy.count))
        
        print(isPalindromePermutation("Tact Coa"))
        
        if (isOneAway("pale", "bale")) {
            print("oneWay yes")
        }
        else {
            print("oneWay no")
        }

        print(compress("aabcccccaaa"))
        
        if (isRotation("waterbottle", "waterbottle")) {
            print("isRotation yes")
        }
        else {
            print("isRotation no")
        }
        
        stingIsSubstringOfAnother()
        
        let stringOne : [Character] = ["g","k","s","r","e","k"]
        
        var stringThree: [Character] = Array(repeating: "_", count: stringOne.count)

        
        for (i,val) in stringOne.enumerated() {
            stringThree[i] = stringOne[stringOne.count-i-1]
        }
        
        print(stringThree)
        
        let stringTwo : [Character] = ["g","e","e","k","s","f","o","r","g","e","e","k","s"]

        if (isSubSequence(str1: stringOne , str2: stringTwo, m: stringOne.count, n: stringTwo.count)) {
            print("isSubSequence yes")
        }
        else {
            print("isSubSequence no")
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func characterExample() {
        let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
        let catString = String(catCharacters)
        print(catString)
        
        let mouseChar :[Character] = ["M","O","U","S","E"]
        let moustStr = String(mouseChar)
        print(moustStr)
        
        let c :Character = "c"
        
        let hello = "hello"
        let helloStartIndex = hello.characters.startIndex // 0
        
        print(c)
    }

    func countChar() {
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.count) characters")
    }
    
    func prefixSample() {
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell",
            "malik : jagirdar",
            "malik basha : jagirdar",
            "hamza malik basha : jagirdar"
        ]
        
        var malikSceneCount = 0
        var jagirdarSceneCount = 0

        for scene in romeoAndJuliet {
            if scene.hasPrefix("malik ") {
                malikSceneCount += 1
            }
           if scene.hasSuffix("jagirdar") {
                jagirdarSceneCount += 1
            }
        }
    }
    
    func indexSample () {
        
        let hello = "hello"
        
        let startIndex = hello.startIndex // 0
        let endIndex = hello.endIndex     // 5
        hello[startIndex]                 // "h"
        
        
        let matchedIndex = hello.characters.index(of: "l") // 2
        let nomatchIndex = hello.characters.index(of: "A") // nil
        
        let greeting = "Guten Tag!"
        print("startIndex \(greeting.startIndex)")
        print("val \(greeting[greeting.startIndex])")

        
        print("before testing \(greeting[greeting.index(before: greeting.endIndex)])")
        
        print("before testing \(greeting[greeting.index(after: greeting.startIndex)])")

        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        
    }

    func insertAndRemove () {
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)

        // welcome now equals "hello!"
        welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
        print(welcome)
    }
    
    func rangeSample () {
        let fqdn = "useyourloaf.com"
        let tldEndIndex = fqdn.endIndex
        let tldStartIndex = fqdn.index(tldEndIndex, offsetBy: -3)
        
        let range = Range(uncheckedBounds: (lower: tldStartIndex, upper: tldEndIndex))
        print(fqdn[range]) // "com"
        
        let endOfDomain = fqdn.index(fqdn.endIndex, offsetBy: -4)
        let rangeOfDomain = fqdn.startIndex ..< endOfDomain
        fqdn[rangeOfDomain] // useyourloaf
        print(fqdn[rangeOfDomain])

        if let rangeOfTLD = fqdn.range(of: "com") {
            let tld = fqdn[rangeOfTLD]
            print(tld)// "com"
        }
        
    }
    
    func rangeOFString () {
        let string = "hello Swift"
        
        if string.range(of:"Swift") != nil {
            print("exists")
        }
        
        // alternative: not case sensitive
        if string.lowercased().range(of:"swift") != nil {
            print("exists")
        }
        
        let value = "Hello world"
        
        print(value.contains("llo")) // true
        print(value.contains("wr"))    // false
        
        print(value.containsIgnoringCase(find: "hello"))    // true
        print(value.containsIgnoringCase(find: "Hello"))    // true
        print(value.containsIgnoringCase(find: "bo"))       // false
    }
    
    // MARK: - Interview Questions
    
    
    // MARK: - Unique character

    func uniqueCharacter() {
        let value = "Helo"
        
        print(uniqueCharWithoutAdditionalDS(value))
        
       if(value.hasUniqueCharacter()) {
            print("YES")
        }
        else {
            print("NO")
        }
    }
    
    //  This will take O( n2) time and 0 (1) space.
    func uniqueCharWithoutAdditionalDS(_ string: String) -> String {
        for i in 0..<string.count {
            for j in (i+1)..<string.count {
                let firstIndex = string.index(string.startIndex, offsetBy: i)
                let secondIndex = string.index(string.startIndex, offsetBy: j)
                if (string[firstIndex] == string[secondIndex]) {
                    return "Not all characters are unique"
                }
            }
        }
        return "All the characters are unique"
    }
    
    
//    1.2 Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.
    
    //  (Count characters)
    // Time Complexity: O(n)
    

    func isPermutation(_ str1: String, _ str2: String) -> Bool {
        if (str1.count != str2.count) {
            return false
        }
        
        var charCount: [Character : Int] = [:]
        
        for char in str1 {
            charCount[char, default: 0] += 1
        }
        for char in str2 {
            guard let count = charCount[char] else {
                return false
            }
            charCount[char] = count - 1
            if (charCount[char] == 0) {
                charCount.removeValue(forKey: char)
            }
        }
        return charCount.isEmpty
    }
    
    func urlify(_ str: String, _ size: Int) -> String {
        let word = str.trimmingCharacters(in: .whitespacesAndNewlines)
        var stringSize = size
        for char in word {
            if char == " " { stringSize += 2 }
        }
        var chars: [Character] = Array(repeating: Character("_"), count: stringSize)
        var index = 0
        for char in word {
            if char != " " {
                chars[index] = char
                index += 1
            } else {
                chars[index] = "%"
                chars[index+1] = "2"
                chars[index+2] = "0"
                index += 3
            }
        }
        return String(chars)
    }
    
    // MARK: - Polindrome
    
    /// Only accept letters and returns all lowercase letters
    private func clean(_ str: String) -> String {
        let charSet = CharacterSet.lowercaseLetters.inverted.union(.whitespacesAndNewlines)
        return str.lowercased().components(separatedBy: charSet).joined()
    }
    
     func isOdd(_ number: Int) -> Bool {
        
        return number % 2 == 1
        
        
    }
    
    /// Complexity: O(n) time and space
    public func isPalindromePermutation(_ str: String) -> Bool {
        let cleaned = clean(str)
        
        var counter: [Character : Int] = [:]
        for char in cleaned {
            counter[char, default: 0] += 1
        }
        
          let oddCharCountw = counter.values.filter(isOdd)
        
        let oddCharCount = counter.values.filter(isOdd).count
        
        return oddCharCount < 2
    }
    
    // MARK: - OneWay
    
     func isOneAway(_ lhs: String, _ rhs: String) -> Bool {
        if (lhs.count == rhs.count) {
            return isOneEdit(lhs, rhs)
        } else if (lhs.count + 1 == rhs.count) {
            return isOneInsertion(rhs, lhs)
        } else if (lhs.count == rhs.count + 1) {
            return isOneInsertion(lhs, rhs)
        }
        return false
    }
    
     func isOneInsertion(_ lhs: String, _ rhs: String) -> Bool {
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < lhs.count && rightIndex < rhs.count {
            let leftChar = lhs[lhs.index(lhs.startIndex, offsetBy: leftIndex)]
            let rightChar = rhs[rhs.index(rhs.startIndex, offsetBy: rightIndex)]
            
            if leftChar == rightChar {
                leftIndex += 1
                rightIndex += 1
            } else {
                if (leftIndex != rightIndex) {
                    return false
                }
                leftIndex += 1
            }
        }
        return true
    }
    
     func isOneEdit(_ lhs: String, _ rhs: String) -> Bool {
        var foundEdit = false
        for (i, leftChar) in lhs.enumerated() {
            let index = rhs.index(rhs.startIndex, offsetBy: i)
            if (leftChar != rhs[index]) {
                if foundEdit {
                    return false
                }
                foundEdit = true
            }
        }
        return true
    }
    
    // MARK: -  String Compression
    
    /// Complexity: O(n) time and space
    public func compress(_ str: String) -> String {
        let strCount = str.utf8.count
        var chars: [Character] = Array(repeating: "_", count: strCount)
        var current: Character? = nil
        var counter = 0
        var index = 0
        
        for char in str {
            if char != current {
                if counter > 0 {
                    chars[index] = Character("\(counter)")
                    index += 1
                    if index >= strCount { return str }
                }
                
                chars[index] = char
                index += 1
                if index >= strCount { return str }
                
                current = char
                counter = 0
            }
            counter += 1
        }
        
        if counter > 0 {
            chars[index] = Character("\(counter)")
        }
        
        return String(chars.prefix(index + 1))
    }
    
    // s1 is s2 rotation
    
    // MARK :- rotaion string
    
    public var isSubstringCallCount = 0
    
    public func isSubstring(_ needle: String, _ haystack: String) -> Bool {
        isSubstringCallCount += 1
        return haystack.range(of: needle) != nil
    }
    
    public func isRotation(_ s1: String, _ s2: String) -> Bool {
        
        let ss = s2+s2
        let sss = ss.range(of: s1)
        print(s1[sss!])
        
        return isSubstring(s1, s2 + s2)
    }
    
    
    // MARK: - Simple Problesm
    
   //  Check if a string is substring of another
    
    func stingIsSubstringOfAnother()  {
        let s1 = "for"
        let s2 = "geeksforgeeks"
        
        if((s2.range(of: s1)) != nil) {
            print("substring")
        }
        else {
            print("not a substring")
        }
    }
    
    // Given two strings, find if first string is a subsequence of second

    func isSubSequence(str1:[Character], str2 : [Character], m:Int, n:Int) -> Bool {
        if (m == 0) {
            return true
        }
        if (n == 0) {
            return false
        }
        if (str1[m-1] == str2[n-1]) {
            return isSubSequence(str1: str1, str2: str2, m: m-1, n: n-1);

        }
        return isSubSequence(str1: str1, str2: str2, m: m, n: n-1);
    }
}


extension String {
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

extension String {
    func hasUniqueCharacter () -> Bool {
        var uniqueCharacters = Set<Character>()
        for everyChar in self {
        guard !uniqueCharacters.contains(everyChar) else { return false }
        uniqueCharacters.insert(everyChar)
        }
        return true
    }
    
}

