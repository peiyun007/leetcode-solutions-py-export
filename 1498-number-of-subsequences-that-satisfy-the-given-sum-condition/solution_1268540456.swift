class Solution {
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        let mod = 1_0000_0000_7
        let n = nums.count
        let maxN = 1_0000_0
        var f = Array(repeating: 0, count: maxN)
        f[0] = 1
        for i in 1..<maxN {
            f[i] = (f[i-1] * 2) % mod
        }
        let numsSorted = nums.sorted(by: <)
        var ans = 0
        for i in 0..<n where numsSorted[i] <= target / 2 {
            let x = target - numsSorted[i]
            let idx = bsearch(numsSorted, x)
            guard idx >= i else {
                continue
            }
            let contribute = f[idx-i]
            ans = (ans + contribute) % mod
        }
        return ans
    }

    func bsearch(_ arr: [Int], _ target: Int) -> Int {
        var l = 0, r = arr.count
        while l < r {
            let mid = l + (r-l) / 2
            if arr[mid] <= target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l-1
    }
}