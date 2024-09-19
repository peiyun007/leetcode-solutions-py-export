class Solution {
    func minIncrementForUnique(_ nums: [Int]) -> Int {
        let N = 2_00000
        var cnt = Array(repeating: 0, count: N)
        for x in nums {
            cnt[x] += 1
        }
        var ans = 0, taken = 0
        for x in 0..<N {
            if cnt[x] >= 2 {
                taken += (cnt[x] - 1)
                ans -= x * (cnt[x] - 1)
            } else if taken > 0 && cnt[x] == 0 {
                taken -= 1
                ans += x
            }
        }
        return ans
    }
}