class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var res = [[Int]]()
        var temp = [Int]()
        dfs(&temp, 0, Int.min)
        return res

        func dfs(_ temp: inout [Int], _ idx: Int, _ last: Int) {
            if idx == n {
                if temp.count >= 2 {
                    res.append(temp)
                }
                return
            }
            if nums[idx] >= last {
                temp.append(nums[idx])
                dfs(&temp, idx+1, nums[idx])
                temp.removeLast()
            }
            if nums[idx] != last {
                dfs(&temp, idx+1, last)
            }
        }
    }
}