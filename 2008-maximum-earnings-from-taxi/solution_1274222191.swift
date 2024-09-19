class Solution {
    func maxTaxiEarnings(_ n: Int, _ rides0: [[Int]]) -> Int {
        let rides = rides0.sorted { $0[1] < $1[1] }
        let m = rides.count
        var dp = Array(repeating: 0, count: m+1)
        for i in 0..<m {
            dp[i+1] = dp[i]
            let j = upperBound(rides[i][0], i) + 1
            dp[i+1] = max(dp[i], dp[j]+rides[i][1]-rides[i][0]+rides[i][2])
        }
        return dp[m]

        func upperBound(_ x: Int, _ endIndex: Int) -> Int {
            var l = 0, r = endIndex
            while l < r {
                let mid = l + (r-l) / 2
                if rides[mid][1] <= x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l-1
        }
    }
}