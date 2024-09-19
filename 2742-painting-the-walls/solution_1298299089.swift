struct Pair<T: Hashable, U: Hashable>: Hashable {
    let f: T
    let s: U
    init(_ f: T, _ s: U) {
        self.f = f
        self.s = s
    }
}
typealias PairTwo = Pair<Int, Int>

class Solution {
    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        let n = cost.count
        var memo = [PairTwo: Int]()
        return dfs(n-1, 0)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if j > i {
                return 0
            }
            if i < 0 {
                return Int.max / 2
            }
            if let val = memo[PairTwo(i, j)] {
                return val
            }
            let res = min(dfs(i-1, j-1), dfs(i-1, j+time[i])+cost[i])
            memo[PairTwo(i, j)] = res
            return res
        }
    }
}