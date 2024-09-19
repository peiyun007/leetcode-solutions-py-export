class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var paths = [Int]()
        let nums = nums.sorted(by: <)
        dfs(&res, &paths, nums, 0)
        return res
    }
    private func dfs(_ res: inout [[Int]], _ paths: inout [Int], _ nums: [Int], _ index: Int) {
        res.append(Array(paths))
        for i in index..<nums.count {
            if i > index && nums[i] == nums[i - 1] {
                continue
            }
            paths.append(nums[i])
            dfs(&res, &paths, nums, i + 1)
            paths.removeLast()
        }
    }
}