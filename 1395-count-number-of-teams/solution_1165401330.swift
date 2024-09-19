class Solution {
    struct Pair<T: Hashable, U: Hashable, V: Hashable>: Hashable {
        let f: T
        let s: U
        let t: V
    }
    var memo = [Pair<Int, Int, Bool>: Int]()
    func numTeams(_ rating: [Int]) -> Int {
        var ans = 0
        for i in 0..<rating.count-2{
            ans += solve(rating, i, 1, true) + solve(rating, i, 1, false)
        }
        return ans
    }
    
    func solve(_ rating: [Int], _ idx: Int, _ order: Int, _ isAsc: Bool) -> Int {
        if order == 3 {
            return 1
        }
        if let val = memo[Pair(f: idx, s: order, t: isAsc)] {
            return val
        }
        var ans = 0
        for i in idx+1..<rating.count-2+order {
            if isAsc && rating[i] > rating[idx] {
                ans += solve(rating, i, order+1, true)
            } else if !isAsc && rating[i] < rating[idx] {
                ans += solve(rating, i, order+1, false)
            }
        }
        memo[Pair(f: idx, s: order, t: isAsc)] = ans
        return ans
    }
}