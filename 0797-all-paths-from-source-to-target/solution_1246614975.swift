class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        let n = graph.count
        temp.append(0)
        dfs(0)
        return res
        
        func dfs(_ i: Int) {
            if i == n-1 {
                res.append(temp)
                return
            }
            for v in graph[i] {
                temp.append(v)
                dfs(v)
                temp.removeLast()
            }
        }
    }
}