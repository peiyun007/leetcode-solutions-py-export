class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()

    func dfs(_ stones: [Int], _ l: Int, _ r: Int, _ sum: Int) -> Int {
        if l >= r {
            return 0
        }
        if let val = memo[Pair(f: l, s: r)] {
            return val
        }
        let ans = max(sum - stones[l] - dfs(stones, l+1, r, sum-stones[l]),
                        sum - stones[r] - dfs(stones, l, r-1, sum-stones[r]))
        memo[Pair(f: l, s: r)] = ans
        return ans
    }

    func stoneGameVII(_ stones: [Int]) -> Int {
        let sum = stones.reduce(0) { $0 + $1 }
        return dfs(stones, 0, stones.count-1, sum)
    }
}