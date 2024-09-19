class Solution {
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        var ans = Array(s)
        let sArr = Array(s)
        for i in 0..<ans.count {
            ans[indices[i]] = sArr[i]
        }
        return String(ans)
    }
}