class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&res, &temp, nums, 0)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ index: Int) {
        res.append(temp)
        for i in index..<nums.count {
            temp.append(nums[i])
            dfs(&res, &temp, nums, i + 1)
            temp.removeLast()
        }
    }
}