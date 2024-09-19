class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        var jobs = [(Int, Int)]()
        let n = difficulty.count
        for i in 0..<n {
            jobs.append((difficulty[i], profit[i]))
        }
        jobs.sort {
            if $0.0 < $1.0 {
                return true
            } else if $0.0 > $1.0 {
                return false
            } else {
                return $0.1 < $1.1
            }
        }
        let wArr = worker.sorted(by: <)
        var best = 0, res = 0
        var i = 0
        for p in wArr {
            while i < n && p >= jobs[i].0 {
                best = max(best, jobs[i].1)
                i += 1
            }
            res += best
        }
        return res
    }
}