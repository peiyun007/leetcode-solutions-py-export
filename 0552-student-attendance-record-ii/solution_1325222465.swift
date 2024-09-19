class Solution {
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V

        init(_ f: T, _ s: U, _ t: V) {
            self.f = f
            self.s = s
            self.t = t
        }
    }
    typealias Pair3 = Pair<Int, Int, Int>

    func checkRecord(_ n: Int) -> Int {
        let mod = 1_0000_0000_7
        var memo = [Pair3: Int]()
        return dfs(0, 0, 0)

        func dfs(_ day: Int, _ absent: Int, _ late: Int) -> Int {
            if day == n {
                return 1
            }
            if let val = memo[Pair3(day, absent, late)] {
                return val
            }
            var ans = 0
            ans = (ans + dfs(day+1, absent, 0)) % mod
            if absent < 1 {
                ans = (ans + dfs(day+1, 1, 0)) % mod
            }
            if late < 2 {
                ans = (ans + dfs(day+1, absent, late+1)) % mod
            }
            memo[Pair3(day, absent, late)] = ans
            return ans
        }
    }
}