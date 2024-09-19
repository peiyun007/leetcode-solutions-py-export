class Solution {
    func minimumMountainRemovals(_ arr: [Int]) -> Int {
        var dp1 = Array(repeating: 1, count: arr.count)
        var dp2 = Array(repeating: 1, count: arr.count)
        for i in 1..<arr.count {
            for j in 0..<i {
                if arr[i] > arr[j] && 1+dp1[j] > dp1[i] {
                    dp1[i] = 1+dp1[j]
                }
            }
        }
        for i in (0..<arr.count-1).reversed() {
            for j in (i+1..<arr.count).reversed() {
                if arr[i] > arr[j] && 1+dp2[j] > dp2[i] {
                    dp2[i] = 1+dp2[j]
                }
            }
        }
        var ans = 0
        for i in 0..<arr.count {
            if dp1[i] > 1 && dp2[i] > 1 {
                ans = max(ans, dp1[i] + dp2[i] - 1)
            }
        }
        return arr.count-ans
    }
}