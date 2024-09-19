class Solution {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let sArr = Array(s)
        let tArr = Array(t)
        let n = sArr.count
        var preSum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + abs(Int(sArr[i-1].asciiValue ?? 0) - Int(tArr[i-1].asciiValue ?? 0))
        }
        var ans = 0
        for i in 1...n {
            let start = bSearch(preSum, i, preSum[i]-maxCost)
            if start >= 0 {
                ans = max(ans, i-start)
            }
        }
        return ans
    }

    func bSearch(_ arr: [Int], _ endIndex: Int, _ target: Int) -> Int {
        var l = 0, r = endIndex
        while l < r {
            let mid = l + (r - l) / 2
            if arr[mid] >= target {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}