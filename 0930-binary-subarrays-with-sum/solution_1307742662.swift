class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        let n = nums.count
        var map = [Int: Int]()
        var preSum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + nums[i-1]
        }
        map[0] = 1
        var ans = 0
        for i in 0..<n {
            let r = preSum[i+1]
            let l = r - goal
            ans += map[l, default: 0]
            map[r, default: 0] += 1
        }
        return ans
    }
}