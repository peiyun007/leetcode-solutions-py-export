class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let first: T
        let second: U
    }   
    private var memo = [Pair<Int, Int>: Int]()
    func solve(_ pairs: [[Int]], _ n: Int, _ index: Int, _ prev: Int) -> Int {
        if index == n {
            return 0
        }
        if let val = memo[Pair(first: index, second: prev)] {
            return val
        }
        var ans = 0
        if prev == -1 || pairs[prev][1] < pairs[index][0] {
            ans = max(ans, 1 + solve(pairs, n, index+1, index))
        }
        ans = max(ans, solve(pairs, n, index+1, prev))
        memo[Pair(first: index, second: prev)] = ans
        return ans
    }

    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairsSorted = pairs.sorted { $0[0] < $1[0] }
        return solve(pairsSorted, pairsSorted.count, 0, -1)
    }
}