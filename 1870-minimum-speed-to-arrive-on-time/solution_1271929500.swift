class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        let hr100 = Int((hour * 100).rounded())
        let n = dist.count
        if hr100 <= (n-1) * 100 {
            return -1
        }
        var l = 1, r = 1_0000000
        while l < r {
            let mid = l + (r-l) / 2
            var t = 0
            for i in 0..<n-1 {
                t += (dist[i] - 1) / mid + 1
            }
            t *= mid
            t += dist[n-1]
            if t * 100 <= hr100 * mid {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}