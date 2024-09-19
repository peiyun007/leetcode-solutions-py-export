class Solution {
    func longestMountain(_ arr: [Int]) -> Int {
        var dp1 = Array(repeating: 1, count: arr.count)
        var dp2 = Array(repeating: 1, count: arr.count)
        for i in 1..<arr.count {
            if arr[i] > arr[i-1] && 1+dp1[i-1] > dp1[i] {
                dp1[i] = 1+dp1[i-1]
            }
        }
        for i in (0..<arr.count-1).reversed() {
            if arr[i] > arr[i+1] && 1+dp2[i+1] > dp2[i] {
                dp2[i] = 1+dp2[i+1]
            }
        }
        var ans = 0
        for i in 0..<arr.count {
            if dp1[i] > 1 && dp2[i] > 1 {
                ans = max(ans, dp1[i] + dp2[i] - 1)
            }
        }
        return ans
    }
}