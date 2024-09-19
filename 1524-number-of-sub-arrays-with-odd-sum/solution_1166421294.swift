class Solution {
    let mod = 1_0000_0000_7

    func numOfSubarrays(_ arr: [Int]) -> Int {
        var dp1 = Array(repeating: 0, count: arr.count)
        var dp2 = Array(repeating: 0, count: arr.count)
        dp1[0] = arr[0] % 2 == 1 ? 1 : 0
        dp2[0] = arr[0] % 2 == 0 ? 1 : 0
        var res = 0
        res += dp1[0]

        for i in 1..<arr.count {
            if arr[i] % 2 == 1 {
                dp1[i] = dp2[i-1] + 1
                dp2[i] = dp1[i-1]
            } else {
                dp1[i] = dp1[i-1]
                dp2[i] = dp2[i-1] + 1
            }
            res = (res + dp1[i]) % mod
        }
        return res
    }
}