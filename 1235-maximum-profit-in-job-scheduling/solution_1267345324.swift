class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let n = startTime.count
        var jobs = [(Int, Int, Int)]()
        for i in 0..<n {
            jobs.append((startTime[i], endTime[i], profit[i]))
        }
        jobs.sort { $0.1 < $1.1 }
        var dp = Array(repeating: 0, count: n+1)
        for i in 1...n {
            let k = bsearch(jobs[i-1].0, i-1)
            dp[i] = max(dp[i-1], dp[k+1] + jobs[i-1].2)
        }
        return dp[n]

        func bsearch(_ target: Int, _ endIndex: Int) -> Int {
            var l = 0, r = endIndex
            while l < r {
                let mid = l + (r-l) / 2
                if jobs[mid].1 <= target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l - 1
        }
    }
}