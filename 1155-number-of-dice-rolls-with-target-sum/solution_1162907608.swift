class Solution {
    private let mod = 1_0000_0000_7
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }

    func solve(_ n: Int, _ k: Int, _ target: Int, _ memo: inout [Pair<Int, Int, Int> : Int]) -> Int {
        if target == 0 && n == 0 {
            return 1
        }
        if n == 0 || target <= 0 {
            return 0
        }
        if let val = memo[Pair(f: n, s: k, t: target)] {
            return val
        }
        var ans = 0
        for i in 1...k {
            ans = ans + solve(n-1, k, target-i, &memo)
            ans = ans % mod
        }
        memo[Pair(f: n, s: k, t: target)] = (ans % mod)
        return ans
    }

    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var memo = [Pair<Int, Int, Int> : Int]()
        return solve(n, k, target, &memo)
    }

}