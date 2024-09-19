class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return nums.reduce(0, +)
        }
        let sorted = nums.sorted {$0 < $1}
        var ans = sorted[0] + sorted[1] + sorted[2]
        for i in 0 ..< nums.count - 2 {
            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if abs(sum - target) < abs(ans - target) {
                    ans = sum
                }
                if ans == target {
                    return ans
                }
                if sum > target {
                    k = k - 1
                } else {
                    j = j + 1
                }
            }
        }
        return ans
    }
}