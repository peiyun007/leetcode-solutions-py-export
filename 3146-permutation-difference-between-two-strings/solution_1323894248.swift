class Solution {
    func findPermutationDifference(_ s: String, _ t: String) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        let n = sArr.count
        var mps = [Character: Int]()
        for (i, ch) in sArr.enumerated() {
            mps[ch] = i
        }
        var ans = 0
        for (i, ch) in tArr.enumerated() {
            ans += abs(i-mps[ch, default: 0])
        }
        return ans
    }
}