class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U

        init(_ f: T, _ s: U) {
            self.f = f
            self.s = s
        }
    }
    typealias PairTwo = Pair<Int, Int>

    func soupServings(_ n0: Int) -> Double {
        let n = (n0 + 24) / 25
        if n >= 179 {
            return 1.0
        }
        var memo = [PairTwo: Double]()
        return dfs(n, n)

        func dfs(_ a: Int, _ b: Int) -> Double {
            if a == 0 && b == 0 {
                return 0.5
            }
            if a == 0 {
                return 1
            }
            if b == 0 {
                return 0
            }
            if let val = memo[PairTwo(a, b)] {
                return val
            }
            let res = (dfs(max(a-4, 0), b) + dfs(max(a-3, 0), max(b-1, 0)) + dfs(max(a-2, 0), max(b-2, 0)) + dfs(max(a-1, 0), max(b-3, 0))) / 4.0
            memo[PairTwo(a, b)] = res
            return res
        }
    }
}