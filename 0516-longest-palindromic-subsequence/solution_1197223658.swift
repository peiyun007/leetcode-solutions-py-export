class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        /// 参考：花花酱 LeetCode 516
        let arr = Array(s)
        let n = arr.count
        // var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        var dp0 =  Array(repeating: 0, count: n)   //长度为l的
        var dp1 =  Array(repeating: 0, count: n)   //长度为l-1的
        var dp2 =  Array(repeating: 0, count: n)   //长度为l-2的
        for l in 1...n {
            for i in 0...n-l {
                let j = i + l - 1
                if i == j {
                    dp0[i] = 1
                    continue
                }
                if arr[i] == arr[j] {
                    dp0[i] = dp2[i+1] + 2
                } else {
                    dp0[i] = max(dp1[i+1], dp1[i])
                }
            }
            (dp0, dp1) = (dp1, dp0)
            (dp0, dp2) = (dp2, dp0)
        }
        return dp1[0]
    }
}