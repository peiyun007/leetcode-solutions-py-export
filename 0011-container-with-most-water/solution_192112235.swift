class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }
        var i = 0, j = height.count - 1
        var water = 0
        while i < j {
            water = max(water, (j - i) * min(height[i], height[j]))
            if height[i] < height[j] {
                i += 1
            } else {
                j -= 1
            }
        }
        return water
    }
}