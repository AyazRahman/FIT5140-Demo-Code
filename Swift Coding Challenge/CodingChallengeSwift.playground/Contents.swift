import XCTest

/*
 Given a non-empty array of integers, every number will have at least a pair except for one. Find the single unique number
 
 Examples:
 [2,1,2] -> 1
 [3,1,2,2,3] -> 1
 */

func uniqueNumber(_ numbers: [Int]) -> Int {
    //Note: Should have a linear complexity O(n) or better. Optional: Try to solve it without using extra memory
    
    return -1
}

/*
 Definition: A String is "beautiful" if it has two consecutive equal characters. Examples of beautiful strings are "KEEP", "ZZZZ" and "TTORR", while the following are not beautiful: "A", "GH" and "ABCABCBX"
 
 You are given S and you are going to remove exactly one character from S. Is it possible that the new String will be "beautiful"? If yes return "Possible". Otherwise, return "Impossible".
 
 Note the return value is case sensitive
 
 */

func makeTwoConsecutive(_ S: String)-> String{
    // Note: the function should have a minimum complexity O(n) or better
    
    
    return ""
}

/*
 
 A string S of lower case is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts
 
 Example:  "ababcbacadefegdehijhklij"  [9,7,8]
 
 From the output we can see that the string can be split into 3 substrings(parts) of length 9, 7 and 8. The substrings(parts) would be "ababcbaca", "defegde" and "hijhklij"
 
 
 */


func partionLabels(_ S: String) -> [Int] {
    // Note: the function should have a linear complexity O(n) or better
    
    return []
}



func test(){
    //Test cases for uniqueNumber
    XCTAssertEqual(uniqueNumber([2,1,2]), 1)
    XCTAssertEqual(uniqueNumber([5]), 5)
    XCTAssertEqual(uniqueNumber([1,2,3,1,2]), 3)
    XCTAssertEqual(uniqueNumber([2,1,2]), 1)
    XCTAssertEqual(uniqueNumber([1,1,1,1,5,1,1]), 5)
    
    //Test cases for makeTwoConsecutive
    XCTAssertEqual(makeTwoConsecutive("BCAB"), "Impossible")
    XCTAssertEqual(makeTwoConsecutive("BB"), "Impossible")
    XCTAssertEqual(makeTwoConsecutive("A"), "Impossible")
    XCTAssertEqual(makeTwoConsecutive("AABB"), "Possible")
    XCTAssertEqual(makeTwoConsecutive("BAB"), "Possible")
    
    //Test cases for partitionLabels
    XCTAssertEqual(partionLabels("abc"), [1,1,1])
    XCTAssertEqual(partionLabels("aabbbbcc"), [2,4,2])
    XCTAssertEqual(partionLabels("ababcbacadefegdehijhklij"), [9,7,8])
    XCTAssertEqual(partionLabels("abca"), [4])
}

test()
