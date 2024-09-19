class Solution {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        let n = groups.count
        var f = Array(repeating: 1, count: n)
        var from = Array(repeating: -1, count: n)
        var ans = 1
        for i in 0..<n {
            for j in 0..<i {
                if groups[j] != groups[i] && f[j] + 1 > f[i] {
                    f[i] = f[j] + 1
                    from[i] = j
                    ans = max(ans, f[i])
                }
            }
        }
        var arr = [String]()
        for i in 0..<n {
            if f[i] == ans {
                var j = i
                while j >= 0 {
                    arr.insert(words[j], at: 0)
                    j = from[j]
                }
                break
            }
        }
        return arr
    }
}