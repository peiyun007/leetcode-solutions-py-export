class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted(by: <)
        var res = [[Int]]()
        var temp = [Int]()
        var used = Array(repeating: false, count: nums.count)
        dfs(&res, &temp, nums, &used)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ used: inout [Bool]) {
        if temp.count == nums.count {
            res.append(Array(temp))
        } else {
            for i in 0..<nums.count {
                let flag1 = used[i] || (i > 0 && nums[i] == nums[i - 1] && !used[i - 1])
                let flag2 = used[i] || i > 0 && nums[i] == nums[i - 1] && used[i - 1]
//                print("temp = \(temp), nums[\(i)] = \(nums[i]), flag1 = \(flag1)")
                // print("temp = \(temp), nums[\(i)] = \(nums[i]), flag2 = \(flag2)")
                if flag2  {
                    continue
                }
                temp.append(nums[i])
                used[i] = true
                dfs(&res, &temp, nums, &used)
                temp.removeLast()
                used[i] = false
            }
        }
    }
}