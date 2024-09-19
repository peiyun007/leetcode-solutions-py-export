class Solution {
    func waysToSplit(_ nums: [Int]) -> Int {
        let n = nums.count
        let mod = 1_0000_0000_7
        var preSum = Array(repeating: 0, count: n+1)
        for i in 1...n {
            preSum[i] = preSum[i-1] + nums[i-1]
        }
        var ans = 0
        for i in 0..<n {
            let left = preSum[i+1]
            let midStart = lowerBound(i+2, left*2)
            let rest = preSum[n] - left
            let midEnd = upperBound(i+2, left+rest/2)
            if midStart < 1 || midStart > n || midEnd < 1 || midEnd > n {
                continue
            }
            let diff = midEnd - midStart + 1
            if diff >= 1 {
                ans = (ans + diff) % mod
            }
        }
        return ans

        func lowerBound(_ startIndex: Int, _ x: Int) -> Int {
            var l = startIndex, r = n
            while l < r {
                let mid = l + (r-l) / 2
                if preSum[mid] >= x {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }

        func upperBound(_ startIndex: Int, _ x: Int) -> Int {
            var l = startIndex, r = n
            while l < r {
                let mid = l + (r-l) / 2
                if preSum[mid] <= x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l - 1
        }
    }
}