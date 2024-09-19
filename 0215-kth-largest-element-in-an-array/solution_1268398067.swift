class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var map = Array(repeating: 0, count: 20002)
        for i in 0..<nums.count {
            map[nums[i]+10000] += 1
        }
        var kx = k
        for i in (0...20001).reversed() {
            if map[i] > 0 {
                kx -= map[i]
                if kx <= 0 {
                    return i - 10000
                }
            }
        }
        return -1
    }
}