class Solution {
    let mod = 1_0000_0000_7
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }
    var memo = [Pair<Int, Int, Int>: Int]()

    func dfs(_ rollMax: [Int], _ n: Int, _ lastRoll: Int, _ lastRollTimes: Int) -> Int {
        if lastRoll != -1 && lastRollTimes > rollMax[lastRoll - 1] {
            return 0
        }
        if n == 0 {
            return 1
        }
        if let val = memo[Pair(f: n, s: lastRoll, t: lastRollTimes)] {
            return val
        }
        var ans = 0
        for i in 1...6 {
            if i == lastRoll {
                ans += dfs(rollMax, n-1, i, lastRollTimes+1)
                ans = ans % mod
            } else {
                ans += dfs(rollMax, n-1, i, 1)
                ans = ans % mod
            }
        }
        memo[Pair(f: n, s: lastRoll, t: lastRollTimes)] = ans
        return ans
    }

    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        return dfs(rollMax, n, -1, 0)
    }
}