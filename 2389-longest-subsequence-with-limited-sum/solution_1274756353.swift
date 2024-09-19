class Solution {
    func answerQueries(_ nums0: [Int], _ queries: [Int]) -> [Int] {
        let nums = nums0.sorted(by: <)
        let n = nums.count
        let m = queries.count
        var preSum = Array(repeating: 0, count: n+1)
        for i in 0..<n {
            preSum[i+1] = preSum[i] + nums[i]
        }
        var res = [Int]()
        for x in queries {
            let i = bsearch(preSum, x)
            res.append(i+1-1)
        }
        return res
    }

    func bsearch(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r - l) / 2
            if arr[mid] <= target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l - 1
    }
}