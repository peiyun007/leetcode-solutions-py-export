class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()

    func stoneGameII(_ piles: [Int]) -> Int {
        var suffix = Array(repeating: 0, count: piles.count+1)
        for i in (0..<piles.count).reversed() {
            suffix[i] = suffix[i+1] + piles[i]
        }
        let sum = suffix[0]
        return (sum + solve(piles, suffix, 0, 1)) / 2
    }

    func solve(_ piles: [Int], _ suffix: [Int], _ s: Int, _ M: Int) -> Int {
        if s >= piles.count {
            return 0
        }
        if let val = memo[Pair(f: s, s: M)] {
            return val
        }
        if s+2*M >= piles.count {
            memo[Pair(f: s, s: M)] = suffix[s]
            return suffix[s]
        }
        var best = Int.min
        var cur = 0
        for x in 1...2*M {
            cur += piles[s+x-1]
            best = max(best, cur-solve(piles, suffix, s+x, max(x, M)))
        }
        memo[Pair(f: s, s: M)] = best
        return best
    }
}