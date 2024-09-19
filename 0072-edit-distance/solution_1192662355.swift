class Solution {
    
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var dict = [Pair<Int, Int>: Int]()

    func dp(_ arr1: [Character], _ arr2: [Character], _ i: Int, _ j: Int) -> Int {
        if i < 0 {
            return j+1
        }
        if j < 0 {
            return i+1
        }
        if let val = dict[Pair(f: i, s: j)] {
            return val
        }
        var ans = 0
        if arr1[i] == arr2[j] {
            ans = dp(arr1, arr2, i-1, j-1)
        } else {
            ans = min(dp(arr1, arr2, i, j-1), dp(arr1, arr2, i-1, j), dp(arr1, arr2, i-1, j-1)) + 1
        }
        dict[Pair(f: i, s: j)] = ans
        return ans
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let arr1 = Array(word1)
        let arr2 = Array(word2)
        return dp(arr1, arr2, arr1.count-1, arr2.count-1)
    }
}