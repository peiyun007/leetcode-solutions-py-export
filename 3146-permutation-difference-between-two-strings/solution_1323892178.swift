class Solution {
    func findPermutationDifference(_ s: String, _ t: String) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        let n = sArr.count
        var mps = [Character: Int]()
        var mpt = [Character: Int]()
        for (i, ch) in sArr.enumerated() {
            mps[ch] = i
        }
        for (i, ch) in tArr.enumerated() {
            mpt[ch] = i
        }
        var ans = 0
        for i in 0..<n {
            ans += abs(mps[sArr[i], default: 0] - mpt[sArr[i], default: 0])
        }
        return ans
    }
}