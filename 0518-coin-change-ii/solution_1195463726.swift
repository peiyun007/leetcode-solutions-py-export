class Solution {
    
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
    }
    var memo = [Pair<Int, Int>: Int]()

    func dp(_ amount: Int, _ coins: [Int], _ i: Int) -> Int {
        if amount == 0 {
            return 1
        }
        if i >= coins.count {
            return 0
        }
        if coins[i] > amount {
            return 0
        }
        if let val = memo[Pair(f: amount, s: i)] {
            return val
        }
        let res = dp(amount, coins, i+1) + dp(amount-coins[i], coins, i)
        memo[Pair(f: amount, s: i)] = res
        return res
    }

    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var coinsSorted = coins.sorted { $0 < $1 }
        return dp(amount, coinsSorted, 0)
    }
}