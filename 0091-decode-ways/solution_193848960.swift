/*
class Solution {
    func numDecodings(_ s: String) -> Int {
        var mem = Array(repeating: -1, count: s.count + 1)
        return helper_dp(Array(s), s.count, &mem)
    }
    
    func helper_dp(_ chars: [Character], _ k: Int, _ mem: inout [Int]) -> Int {
        if k == 0 {
            return 1
        }
        let start = chars.count - k
        if chars[start] == "0" {
            return 0
        }
        if mem[k] != -1 {
            return mem[k]
        }
        var res = helper_dp(chars, k - 1, &mem)
        if k >= 2 && Int(String(chars[start..<start+2]))! <= 26 {
            res += helper_dp(chars, k - 2, &mem)
        }
        mem[k] = res
        return res
    }
}
*/

class Solution {
    func numDecodings(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        var dp = Array(repeating: 0, count: s.count + 1)
        let chars = Array(s)
        dp[0] = 1
        dp[1] = chars[0] == "0" ? 0 : 1
        guard s.count > 1 else {
            return dp[1]
        }
        for i in 2...s.count {
            let first = Int(String(chars[i-1..<i]))!
            let second = Int(String(chars[i-2..<i]))!
            if first >= 1 && first <= 9 {
                dp[i] += dp[i-1]
            }
            if second >= 10 && second <= 26 {
                dp[i] += dp[i-2]
            }
        }
        return dp[s.count]
    }
}