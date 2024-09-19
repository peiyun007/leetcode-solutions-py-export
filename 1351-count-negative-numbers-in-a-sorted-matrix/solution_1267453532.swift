class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var ans = 0
        for i in 0..<m {
            var l = 0, r = n
            while l < r {
                let mid = l + (r-l) / 2
                if grid[i][mid] < 0 {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            ans += (n-l)
        }
        return ans
    }
}