class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        var sum = 0
        for num in nums {
            sum += num
        }
        if k <= 0 || sum % k != 0 {
            return false
        }
        var visited = Array(repeating: false, count: nums.count)
        return canPartition(nums, &visited, 0, k, 0, 0, sum / k)
    }
    
    private func canPartition(_ nums: [Int], _ visited: inout [Bool], _ start_index: Int, _ k: Int, _ cur_sum: Int, _ cur_num: Int, _ target: Int) -> Bool {
        if k == 1 {
            return true
        }
        if cur_sum == target && cur_num > 0 {
            return canPartition(nums, &visited, 0, k - 1, 0, 0, target)
        }
        for i in start_index..<nums.count {
            if !visited[i] {
                visited[i] = true
                let match = canPartition(nums, &visited, i + 1, k, cur_sum + nums[i], cur_num + 1, target)
                if match {
                    return true
                }
                visited[i] = false
            }
        }
        return false
    }
}