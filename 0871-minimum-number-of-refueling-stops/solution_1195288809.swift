class Solution {
    func minRefuelStops(_ target: Int, _ startFuel: Int, _ stations: [[Int]]) -> Int {
        // dp[i][j]:Maximum distance with j refuels from total of 'i' fuelStops
        var dp = Array(repeating: 0, count: stations.count+1)
        dp[0] = startFuel
        for i in 0..<stations.count {
            for j in (1...i+1).reversed() {
                if dp[j-1] >= stations[i][0] {
                    dp[j] = max(dp[j], dp[j-1] + stations[i][1])
                }
            }
        }
        for i in 0..<dp.count {
            if dp[i] >= target {
                return i
            }
        }
        return -1
    }
}