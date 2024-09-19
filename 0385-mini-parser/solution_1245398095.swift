/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    var index = 0
    func deserialize(_ s: String) -> NestedInteger {
        let arr = Array(s)
        return dfs(arr)
    }

    func dfs(_ arr: [Character]) -> NestedInteger {
        if arr[index] == "[" {
            index += 1
            let ni = NestedInteger()
            while arr[index] != "]" {
                ni.add(dfs(arr))
                if arr[index] == "," {
                    index += 1
                }
            }
            index += 1
            return ni
        } else {
            var num = 0
            var isNeg = false
            if arr[index] == "-" {
                isNeg = true
                index += 1
            }
            while index < arr.count && arr[index].isASCII && arr[index].isNumber {
                num = num * 10 + Int(arr[index].asciiValue ?? 0) - Int(Character("0").asciiValue ?? 0)
                index += 1
            }
            if isNeg {
                num *= -1
            }
            let ni = NestedInteger()
            ni.setInteger(num)
            return ni
        }
    }
}