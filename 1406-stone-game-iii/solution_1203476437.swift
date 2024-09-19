class Solution {
    // struct Pair<T: Hashable, U: Hashable>: Hashable {
    //     let f: T
    //     let s: U
    // }
    var memo = [Int: Int]()

    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let res = solve(stoneValue, 0)
        if res > 0 {
            return "Alice"
        } else if res < 0 {
            return "Bob"
        } else {
            return "Tie"
        }
    }

    func solve(_ stoneValue: [Int], _ idx: Int) -> Int {
        if idx >= stoneValue.count {
            return 0
        }
        if let val = memo[idx] {
            return val
        }
        var best = Int.min
        var curr = 0
        for i in 1...3 {
            if idx+i-1 >= stoneValue.count {
                break
            }
            curr += stoneValue[idx+i-1]
            best = max(best, curr-solve(stoneValue, idx+i))
        }
        memo[idx] = best
        return best
    }
}