class Solution {
    
    var memo = [String: Bool]()

    func dp(_ s: String, _ wordSet: Set<String>) -> Bool {
        if wordSet.contains(s) {
            return true
        }
        if let val = memo[s] {
            return val
        }
        var res = false
        for i in 0..<min(s.count, 20) {
            let index = s.index(s.startIndex, offsetBy: i)
            res = dp(String(s[..<index]), wordSet) && dp(String(s[index...]), wordSet)
            if res {
                break
            }
        }
        memo[s] = res
        return res
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        return dp(s, Set<String>(wordDict))
    }

}