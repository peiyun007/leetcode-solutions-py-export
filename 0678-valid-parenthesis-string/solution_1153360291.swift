class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let first: T
        let second: U
    }
    private var memo = [Pair<Int, Int> : Bool]()
    func dfs(_ arr: [Character], _ index: Int, _ openingBracket: Int) -> Bool {
        if index == arr.count {
            return openingBracket == 0
        }
        if let val = memo[Pair(first: index, second: openingBracket)] {
            return val
        }
        var res = false
        if arr[index] == "*" {
            res = res || dfs(arr, index+1, openingBracket+1)
            if openingBracket > 0 {
                res = res || dfs(arr, index+1, openingBracket-1)
            }
            res = res || dfs(arr, index+1, openingBracket)
        } else {
            if arr[index] == "(" {
                res = dfs(arr, index+1, openingBracket+1)
            } else {
                if openingBracket > 0 {
                    res = dfs(arr, index+1, openingBracket-1)
                }
            }
        }
        memo[Pair(first: index, second: openingBracket)] = res
        return res
    }

    func checkValidString(_ s: String) -> Bool {
        return dfs(Array(s), 0, 0)
    }
}