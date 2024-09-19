class Solution {
    func getLongestSubsequence(_ words: [String], _ groups: [Int]) -> [String] {
        var ans = [String]()
        let n = groups.count
        for i in 0..<n {
            if i == n - 1 || groups[i] != groups[i+1] {
                ans.append(words[i])
            }
        }
        return ans
    }
}