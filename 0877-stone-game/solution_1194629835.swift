class Solution {

    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()

    func score(_ piles: [Int], _ l: Int, _ r: Int) -> Int {
        if l > r {
            return 0
        }
        if l == r {
            return piles[l]
        }
        if let val = memo[Pair(f: l, s: r)] {
            return val
        }
        let res = max(piles[l] - score(piles, l+1, r), piles[r] - score(piles, l, r-1))
        memo[Pair(f: l, s: r)] = res
        return res
    }
    
    func stoneGame(_ piles: [Int]) -> Bool {
        return score(piles, 0, piles.count-1) > 0
    }


}