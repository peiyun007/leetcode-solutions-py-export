class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else {
            return [[Int]]()
        }
        var res = [[Int]]()
        var temp = [Int]()
        let candidates = candidates.sorted(by: <)
        dfs(&res, &temp, candidates, target, 0)
        return res
    }
    
    private func dfs(_ res: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ target: Int, _ start: Int) {
        if target == 0 {
            res.append(Array(temp))
        } else if target >= nums[0] {
            for i in start..<nums.count {
                temp.append(nums[i])
                dfs(&res, &temp, nums, target - nums[i], i)
                temp.removeLast()
            }
        }
    }
}