class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Character>: Int]()
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let n = colors.count
        return solve(Array(colors), neededTime, n-1, "A")
    }

    func solve(_ colors: [Character], _ time: [Int], _ i: Int, _ prev: Character) -> Int {
        if i < 0 {
            return 0
        }
        if let val = memo[Pair(f: i, s: prev)] {
            return val
        }
        let not_pick = time[i] + solve(colors, time, i-1, prev)
        var pick = Int.max
        if prev == "A" || colors[i] != prev {
            pick = solve(colors, time, i-1, colors[i])
        }
        let res = min(not_pick, pick)
        memo[Pair(f: i, s: prev)] = res
        return res
    }
}