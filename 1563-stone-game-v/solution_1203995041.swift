class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()
    var prefixSum = [Int]()

    func stoneGameV(_ stoneValue: [Int]) -> Int {
        prefixSum = Array(repeating: 0, count: stoneValue.count+1)
        for i in 0..<stoneValue.count {
            prefixSum[i+1] = prefixSum[i] + stoneValue[i]
        }
        return dfs(stoneValue, 0, stoneValue.count-1)
    }

    func dfs(_ stoneValue: [Int], _ l: Int, _ r: Int) -> Int {
        if l >= r {
            return 0
        }
        if let val = memo[Pair(f: l, s: r)] {
            return val
        }
        var ans = 0
        for k in l..<r {
            let sum_l = prefixSum[k+1] - prefixSum[l]
            let sum_r = prefixSum[r+1] - prefixSum[k+1]
            if sum_l > sum_r {
                ans = max(ans, sum_r + dfs(stoneValue, k+1, r))
            } else if sum_l < sum_r {
                ans = max(ans, sum_l + dfs(stoneValue, l, k))
            } else {
                ans = max(ans, sum_r + dfs(stoneValue, k+1, r), sum_l + dfs(stoneValue, l, k))
            }
        }
        memo[Pair(f: l, s: r)] = ans
        return ans
    }
}