class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        let sArr = Array(s)
        let n = parent.count
        var g = Array(repeating: [Int](), count: n)
        for (i, p) in parent.enumerated() where p != -1 {
            g[p].append(i)
        }
        var ans = 0
        dfs(0)
        return ans + 1

        func dfs(_ x: Int) -> Int {
            var maxLen = 0
            for y in g[x] {
                let lenY = dfs(y) + 1
                if sArr[y] != sArr[x] {
                    ans = max(ans, maxLen + lenY)
                    maxLen = max(maxLen, lenY)
                }
            }
            return maxLen
        }
    }
}