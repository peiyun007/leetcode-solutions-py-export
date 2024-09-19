class Solution {
    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        let n = books.count
        var memo = Array(repeating: -1, count: n)
        return dfs(n-1)

        func dfs(_ i: Int) -> Int {
            if i < 0 {
                return 0
            }
            if memo[i] != -1 {
                return memo[i]
            }
            var maxH = 0, leftW = shelfWidth, res = Int.max
            for j in (0...i).reversed() {
                leftW -= books[j][0]
                if leftW < 0 {
                    break
                }
                maxH = max(maxH, books[j][1])
                res = min(res, dfs(j-1) + maxH)
            }
            memo[i] = res
            return res
        }
    }
}