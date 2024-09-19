class Solution {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var ans = [Int]()
        var arr = Array(repeating: -1, count: 2*n-1)
        var flag = false
        var visited = Array(repeating: false, count: n+1)
        dfs(0)
        return ans

        func dfs(_ index: Int) {
            if flag {
                return
            }
            if index == 2*n-1 {
                ans = arr
                flag = true
                return
            }
            if arr[index] != -1 {
                dfs(index+1)
                return
            }
            for i in (1...n).reversed() {
                if visited[i] { continue }
                if i == 1 {
                    visited[i] = true
                    arr[index] = i
                    dfs(index+1)
                    arr[index] = -1
                    visited[i] = false
                } else {
                    if index+i < 2*n-1 && arr[index+i] == -1 {
                        visited[i] = true
                        arr[index] = i
                        arr[index+i] = i
                        dfs(index+1)
                        arr[index] = -1
                        arr[index+i] = -1
                        visited[i] = false
                    }
                }
            }
        }
    }
}