class Solution {
    func jump(_ nums: [Int]) -> Int {
        var curr = 0
        var ret = 0
        var last = 0
        for i in 0..<nums.count {
            if i > last {
                last = curr
                ret += 1
            }
            curr = max(curr, i + nums[i])
        }
        return ret
    }
}
