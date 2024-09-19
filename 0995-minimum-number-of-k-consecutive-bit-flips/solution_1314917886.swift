class Solution {
    func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var queue = [Int]()
        var res = 0
        for i in 0..<n {
            if !queue.isEmpty && i >= queue[0] + k {
                queue.removeFirst()
            }
            if queue.count % 2 == nums[i] {
                if i + k > n {
                    return -1
                }
                queue.append(i)
                res += 1
            }
        }
        return res
    }
}