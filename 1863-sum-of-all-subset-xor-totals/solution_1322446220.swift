class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var ans = 0
        let n = nums.count
        dfs(0, 0)
        return ans

        func dfs(_ index: Int, _ temp: Int) {
            if index == n {
                ans += temp
                return
            }
            dfs(index+1, temp)
            dfs(index+1, temp^nums[index])
        }
    }
}