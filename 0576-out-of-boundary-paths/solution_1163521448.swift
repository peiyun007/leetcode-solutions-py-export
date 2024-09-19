class Solution {
    private let mod = 1000000007
    func solve(_ m: Int, _ n: Int, _ maxMove: Int, _ sx: Int, _ sy: Int, _ memo: inout [String: Int]) -> Int {
        if sx < 0 || sx >= m || sy < 0 || sy >= n {
            return 1
        }
        if maxMove == 0  {
            return 0
        }
        if let cacheVal = memo["\(sx)_\(sy)_\(maxMove)"] {
            return cacheVal
        }
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var res = 0
        for dir in dirs {
            res += solve(m, n, maxMove-1, sx+dir.0, sy+dir.1, &memo)
            res%=mod
        }
        memo["\(sx)_\(sy)_\(maxMove)"] = res%mod
        return res
    }

    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        var memo = [String: Int]()
        let ans = solve(m, n, maxMove, startRow, startColumn, &memo)
        return ans%mod
    }
}