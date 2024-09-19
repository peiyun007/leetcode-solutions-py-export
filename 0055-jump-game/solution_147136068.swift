class Solution {
    /* Solution 1: 暴力解决  */
    // func canJump(_ nums: [Int]) -> Bool {
    //     return canJump(0, nums)
    // }
    // func canJump(_ pos: Int, _ nums: [Int]) -> Bool {
    //     if (pos == nums.count - 1) {
    //         return true
    //     }
    //     let farestPos = min(pos + nums[pos], nums.count - 1)
    //     if pos + 1 > farestPos {
    //         return false
    //     }
    //     for i in pos+1...farestPos {
    //         if (canJump(i, nums)) {
    //             return true
    //         }
    //     }
    //     return false
    // }
    // /* Solution 2: DP  */
    // func canJump(_ nums: [Int]) -> Bool {
    //     var dp = Array<Int>(repeating: 0, count: nums.count)
    //     dp[nums.count - 1] = 1
    //     for i in (0...nums.count - 1).reversed() {
    //         let farestPos = min(i + nums[i], nums.count - 1)
    //         if i+1 > farestPos {
    //             continue
    //         }
    //         for j in i+1...farestPos {
    //             if dp[j] == 1 {
    //                 dp[i] = 1
    //                 break
    //             }
    //         }
    //     }
    //     return dp[0] == 1
    // }
    /* Solution 3: Greedy  */
    func canJump(_ nums: [Int]) -> Bool {
        var lastPos = nums.count - 1
        for i in (0..<nums.count - 1).reversed() {
            if i + nums[i] >= lastPos {
                lastPos = i
            }
        }
        return lastPos == 0
    }
}