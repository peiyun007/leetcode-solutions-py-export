class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var nums = arr
        return dfs(start)
        
        func dfs(_ i: Int) -> Bool {
            if i < 0 || i >= arr.count || nums[i] == -1 {
                return false
            }
            if nums[i] == 0 {
                return true
            }
            let a = nums[i]
            nums[i] = -1
            return dfs(i-a) || dfs(i+a)
        }
    }
}