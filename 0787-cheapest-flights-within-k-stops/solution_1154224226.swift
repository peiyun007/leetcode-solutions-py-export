class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var graph = [[[Int]]]()
        let m = flights.count
        for i in 0..<n {
            graph.append([[Int]]())
        }
        for i in 0..<m {
            var tmp = [Int]()
            tmp.append(flights[i][1])
            tmp.append(flights[i][2])
            graph[flights[i][0]].append(tmp)
        }
        var dp = Array(repeating: Array(repeating: -1, count: k+2), count: n)
        let res = dfs(graph, src, dst, k+1, &dp)
        return res == Int.max ? -1 : res
    }
    
    func dfs(_ graph: [[[Int]]], _ src: Int, _ dst: Int, _ k: Int, _ dp: inout [[Int]]) -> Int {
        if k < 0 {
            return Int.max
        }
        if src == dst {
            return 0
        }
        if dp[src][k] != -1 {
            return dp[src][k]
        }
        var res = Int.max
        for it in graph[src] {
            let cho = it[0]
            let price = it[1]
            let cheap = dfs(graph, cho, dst, k-1, &dp)
            if cheap != Int.max {
                res = min(res, cheap + price)
            }
        }
        dp[src][k] = res
        return res
    }
}