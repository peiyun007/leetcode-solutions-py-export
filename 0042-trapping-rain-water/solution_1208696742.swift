class Solution {
    // 参考：花花酱
    func trap(_ height: [Int]) -> Int {
        var left = Array(repeating: 0, count: height.count + 1)
        var right = Array(repeating: 0, count: height.count + 1)
        for i in 0..<height.count {
            left[i+1] = max(left[i], height[i])
        }
        for i in (0..<height.count).reversed() {
            right[i] = max(right[i+1], height[i])
        }
        var ans = 0
        for i in 0..<height.count {
            ans += min(left[i+1], right[i]) - height[i]
        }
        return ans
    }
}