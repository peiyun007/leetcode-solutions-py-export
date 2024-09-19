class Solution {
    func minFallingPathSum(_ A: [[Int]]) -> Int {
        var A = A
        return minFallingPathSumHelper(&A)
    }
    
    private func minFallingPathSumHelper(_ arr: inout [[Int]]) -> Int {
        let N = arr.count
        if N == 1 {
            return arr[0][0]
        }
        for row in (0...N-2).reversed() {
            for col in 0..<N {
                var res = arr[row + 1][col]
                if col > 0 {
                    res = min(res, arr[row + 1][col - 1])
                }
                if col + 1 < N {
                    res = min(res, arr[row + 1][col + 1])
                }
                arr[row][col] += res
            }
        }
        return arr[0].min() ?? 0
    }
}