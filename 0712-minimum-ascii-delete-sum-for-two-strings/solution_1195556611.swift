class Solution {

    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()

    func dp(_ s1: [Character], _ i: Int, _ s2: [Character], _ j: Int) -> Int {
        if i == 0 && j == 0 {
            return 0
        }
        if let val = memo[Pair(f: i, s: j)] {
            return val
        }
        var res = 0
        if i == 0 {
            res = dp(s1, i, s2, j-1) + Int(s2[j-1].asciiValue!)
        } else if j == 0 {
            res = dp(s1, i-1, s2, j) + Int(s1[i-1].asciiValue!)
        } else if s1[i-1] == s2[j-1] {
            res = dp(s1, i-1, s2, j-1)
        } else {
            res = min(dp(s1, i, s2, j-1) + Int(s2[j-1].asciiValue!), 
            dp(s1, i-1, s2, j) + Int(s1[i-1].asciiValue!))
        }
        memo[Pair(f: i, s: j)] = res
        return res
    }

    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
         return dp(Array(s1), s1.count, Array(s2), s2.count)
    }
}