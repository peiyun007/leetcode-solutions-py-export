class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var last = [Character: Int]()
        for (index, ch) in S.enumerated() {
            last[ch] = index
        }
        var start = 0, end = 0
        var ans = [Int]()
        for (index, ch) in S.enumerated() {
            end = max(end, last[ch] ?? 0)
            if index == end {
                ans.append(end-start+1)
                start = end + 1
            }
        }
        return ans
    }
}