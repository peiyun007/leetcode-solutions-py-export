class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        dp[0][1] = 1
        for i in 1...m {
            for j in 1...n {
                if obstacleGrid[i - 1][j - 1] == 0 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[m][n]
    }
    
//     func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
//         let m = obstacleGrid.count
//         let n = obstacleGrid[0].count
//         var curr = Array<Int>(repeating: 0, count: m)
//         var pre = Array<Int>(repeating: 0, count: m)
//         for i in 0..<m {
//             if obstacleGrid[i][0] == 0 {
//                 pre[i] = 1
//             } else {
//                 break;
//             }
//         }
        
//         for j in 1..<n {  //column
//             var flag = false
//             if obstacleGrid[0][j] == 0 {
//                 curr[0] = pre[0]
//                 if curr[0] == 1 {
//                     flag = true
//                 }
//             }
//             for i in 1..<m {    //row
//                 if obstacleGrid[i-1][j-1] == 0 {
//                     curr[i] = curr[i - 1] + pre[i]
                    
//                 } else {
//                     curr[i] = 0
//                 }
//             }
//         }
//         return curr[m]
//     }
}