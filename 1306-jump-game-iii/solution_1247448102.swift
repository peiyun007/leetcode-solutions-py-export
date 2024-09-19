class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = Array(repeating: false, count: arr.count)
        return dfs(start)
        
        func dfs(_ i: Int) -> Bool {
            if i < 0 || i >= arr.count || visited[i] {
                return false
            }
            if arr[i] == 0 {
                return true
            }
            visited[i] = true
            return dfs(i-arr[i]) || dfs(i+arr[i])
        }
    }
}