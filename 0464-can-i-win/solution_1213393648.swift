class Solution {
    var memo = [Int: Bool]()
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        let sum = maxChoosableInteger * (maxChoosableInteger + 1) / 2
        if sum < desiredTotal {
            return false
        }
        if desiredTotal <= 0 {
            return true
        }
        return dp(maxChoosableInteger, desiredTotal, 0)
    }
    
    func dp(_ M: Int, _ T: Int, _ state: Int) -> Bool {
        if T <= 0 {
            return false
        }
        if let val = memo[state] {
            return val
        }
        for i in 1...M {
            if (state & 1 << i) > 0 {
                continue
            }
            if !dp(M, T-i, state | (1 << i)) {
                memo[state] = true
                return true
            }
        }
        memo[state] = false
        return false
    }
}