class Solution {
    private var memo = [Int: Int]()
    func integerReplacement(_ n: Int) -> Int {
        helper(n)
    }

    private func helper(_ n: Int) -> Int {
        if n == 1 {
            return 0
        }
        if let x = memo[n] {
            return x
        }
        var res = 0
        if n % 2 == 0 {
            res = 1 + helper(n / 2)
        } else {
            res = 1 + min(helper(n + 1), helper(n-1))
        }
        memo[n] = res
        return res
    }
}