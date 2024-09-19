class Solution {
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        var lo = 0, preSum = 0, res = 0
        for hi in 0..<A.count {
            preSum += (A[hi] == 0 ? 1 : 0)
            if preSum > K {
                while lo <= hi && A[lo] == 1 {
                    lo += 1
                }
                lo += 1
                preSum -= 1
            }
            res = max(res, hi - lo + 1)
        }
        return res
    }
}