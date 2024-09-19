class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&res, &temp, nums)
        return res
    }
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int]) {
        if temp.count == nums.count {
            res.append(Array(temp))
        } else {
            for i in 0..<nums.count {
                if temp.contains(nums[i]) {continue}
                temp.append(nums[i])
                dfs(&res, &temp, nums)
                temp.removeLast()
            }
        }
    }
}