class Solution {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let n = nums.count
        var cnt = 0
        var maxOr = 0
        dfs(0, 0)
        return cnt

        func dfs(_ index: Int, _ orValue: Int) {
            if index == n {
                if orValue > maxOr {
                    cnt = 1
                    maxOr = orValue
                } else if orValue == maxOr {
                    cnt += 1
                }
                return
            }
            dfs(index+1, orValue | nums[index])
            dfs(index+1, orValue)
        }
    }
}