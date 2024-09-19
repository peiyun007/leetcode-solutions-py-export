class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var queue = [Int]()
        var res = [Int]()
        let n = nums.count
        for i in 0..<k {
            while !queue.isEmpty && queue[queue.count-1] < nums[i] {
                queue.removeLast()
            }
            queue.append(nums[i])
        }
        res.append(queue[0])
        for i in k..<n {
            if nums[i-k] == queue[0] {
                queue.removeFirst()
            }
            while !queue.isEmpty && queue[queue.count-1] < nums[i] {
                queue.removeLast()
            }
            queue.append(nums[i])
            res.append(queue[0])
        }
        return res
    }
}